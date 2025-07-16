using System;
using System.Linq;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using ZXing.Net.Maui;
using ZXing.Net.Maui.Controls;
using CodeABarre.Models;
using CodeABarre.Views;

namespace CodeABarre.ViewModels
{
    public class MainViewModel : BindableObject
    {
        // ========== Champs privés ==========
        private bool _isProcessingBarcode;
        private string _lastScanBarcode = string.Empty;
        private string _resultLabel = "Top text...";
        private string _resultName = "Top text...";
        private BarcodeFormat _currentFormat = BarcodeFormat.Ean13;
        private string _currentValue = "123456789012";
        private bool _isTorchOn;
        private CameraLocation _cameraLocation = CameraLocation.Rear;

        // ========== Propriétés publiques ==========

        public bool IsProcessingBarcode
        {
            get => _isProcessingBarcode;
            set { _isProcessingBarcode = value; OnPropertyChanged(); }
        }

        public string LastScanBarcode
        {
            get => _lastScanBarcode;
            set { _lastScanBarcode = value; OnPropertyChanged(); }
        }

        public string ResultLabel
        {
            get => _resultLabel;
            set { _resultLabel = value; OnPropertyChanged(); }
        }

        public string ResultName
        {
            get => _resultName;
            set { _resultName = value; OnPropertyChanged(); }
        }

        public BarcodeFormat CurrentFormat
        {
            get => _currentFormat;
            set
            {
                // Si on passe à Ean13, vérifie la valeur actuelle
                if (value == BarcodeFormat.Ean13)
                {
                    if (string.IsNullOrEmpty(_currentValue) || _currentValue.Length < 12 || _currentValue.Length > 13 || !_currentValue.All(char.IsDigit))
                    {
                        // Ignore le changement de format si la valeur n'est pas valide
                        return;
                    }
                }
                _currentFormat = value;
                OnPropertyChanged();
            }
        }

        public string CurrentValue
        {
            get => _currentValue;
            set
            {
                // Si le format courant est Ean13, vérifie la valeur
                if (_currentFormat == BarcodeFormat.Ean13)
                {
                    if (string.IsNullOrEmpty(value) || value.Length < 12 || value.Length > 13 || !value.All(char.IsDigit))
                    {
                        // Ignore la valeur si elle n'est pas valide pour EAN-13
                        return;
                    }
                }
                _currentValue = value;
                OnPropertyChanged();
            }
        }

        public bool IsTorchOn
        {
            get => _isTorchOn;
            set { _isTorchOn = value; OnPropertyChanged(); }
        }

        public CameraLocation CameraLocation
        {
            get => _cameraLocation;
            set { _cameraLocation = value; OnPropertyChanged(); }
        }

        // ========== Méthode de traitement du code-barres ==========

        public async Task ProcessBarcode(BarcodeDetectionEventArgs e)
        {
            if (_isProcessingBarcode) return;

            var first = e.Results?.FirstOrDefault();
            if (first is null) return;

            string barcode = first.Value;
            if (barcode == _lastScanBarcode) return;

            _lastScanBarcode = barcode;
            _isProcessingBarcode = true;

            try
            {
                if (barcode.StartsWith("020"))
                {
                    // Traitement d'un lot
                    BatchModel? lot = await BatchModel.GetBatchByBarcodeAsync(barcode);

                    await MainThread.InvokeOnMainThreadAsync(async () =>
                    {
                        if (lot != null)
                        {
                            await Application.Current.MainPage.DisplayAlert(
                                "Lot détecté",
                                $"Code LOT : {barcode}\nNom du lot : {lot.Barcode}\nAutre info : {lot.Code}",
                                "OK"
                            );
                        }
                        else
                        {
                            await Application.Current.MainPage.DisplayAlert(
                                "Lot non trouvé",
                                $"Aucun lot trouvé pour le code : {barcode}",
                                "OK"
                            );
                        }
                    });
                }
                else
                {
                    // Traitement d'un produit
                    ProductModel? product = await ProductModel.GetByBarcodeAsync(barcode);

                    await MainThread.InvokeOnMainThreadAsync(() =>
                    {
                        CurrentFormat = first.Format;
                        CurrentValue = first.Value;
                        ResultLabel = $"Barcodes: {first.Format} -> {first.Value}";

                        if (product != null)
                        {
                            ResultName = $"{product.Name} (Stock: {product.ActualStock})";

                            if (!ProductSession.ScannedProducts.Any(p => p.Barcode == product.Barcode))
                            {
                                ProductSession.ScannedProducts.Add(product);
                            }
                        }
                    });
                }
            }
            catch (Exception ex)
            {
                await MainThread.InvokeOnMainThreadAsync(() =>
                    Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK"));
            }
            finally
            {
                await Task.Delay(2000);
                _isProcessingBarcode = false;
            }
        }

        // ========== Commandes UI ==========

        public void SwitchCamera()
        {
            CameraLocation = CameraLocation == CameraLocation.Rear ? CameraLocation.Front : CameraLocation.Rear;
        }

        public void ToggleTorch()
        {
            IsTorchOn = !IsTorchOn;
        }

        public void Reset()
        {
            if (_currentFormat == BarcodeFormat.Ean13)
        CurrentValue = "123456789012"; // valeur valide
    else
        CurrentValue = "";
    ResultLabel = "Top text...";
    ResultName = "Top text...";
    LastScanBarcode = null;
        }

        // ========== Navigation ==========

        public async Task ShowList()
        {
            try
            {
                await Application.Current.MainPage.Navigation.PushAsync(new HomePage(
                    ProductSession.ScannedProducts,
                    barcodeToDelete =>
                    {
                        var itemToRemove = ProductSession.ScannedProducts.FirstOrDefault(p => p.Barcode == barcodeToDelete);
                        if (itemToRemove != null)
                        {
                            ProductSession.ScannedProducts.Remove(itemToRemove);
                        }
                    },
                    BatchModel.BatchSession.ScannedBatch
                ));
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        // ========== Utilitaires EAN-13 ==========

        /// <summary>
        /// Calcule le chiffre de contrôle (checksum) EAN-13 à partir de 12 chiffres.
        /// </summary>
        public static char CalculateEan13Checksum(string code12)
        {
            if (code12.Length != 12 || !code12.All(char.IsDigit))
                throw new ArgumentException("Le code doit contenir exactement 12 chiffres.");

            int sum = 0;
            for (int i = 0; i < 12; i++)
            {
                int digit = code12[i] - '0';
                sum += (i % 2 == 0) ? digit : digit * 3;
            }
            int checksum = (10 - (sum % 10)) % 10;
            return (char)('0' + checksum);
        }

        /// <summary>
        /// Génère un code EAN-13 valide à partir de 12 chiffres.
        /// </summary>
        public static string GenerateEan13(string code12)
        {
            return code12 + CalculateEan13Checksum(code12);
        }

        /// <summary>
        /// Met à jour CurrentValue avec un code EAN-13 valide à partir de 12 chiffres.
        /// </summary>
        public void SetEan13From12Digits(string code12)
        {
            CurrentValue = GenerateEan13(code12);
        }
    }
}
