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
        private bool _isProcessingBarcode;
        private string _lastScanBarcode = string.Empty;
        private string _resultLabel = "Top text...";
        private string _resultName = "Top text...";
        private BarcodeFormat _currentFormat = BarcodeFormat.Code128;
        private string _currentValue = "Bla";
        private bool _isTorchOn;
        private CameraLocation _cameraLocation = CameraLocation.Rear;

        public bool IsProcessingBarcode
        {
            get => _isProcessingBarcode;
            set
            {
                _isProcessingBarcode = value;
                OnPropertyChanged();
            }
        }

        public string LastScanBarcode
        {
            get => _lastScanBarcode;
            set
            {
                _lastScanBarcode = value;
                OnPropertyChanged();
            }
        }

        public string ResultLabel
        {
            get => _resultLabel;
            set
            {
                _resultLabel = value;
                OnPropertyChanged();
            }
        }

        public string ResultName
        {
            get => _resultName;
            set
            {
                _resultName = value;
                OnPropertyChanged();
            }
        }

        public BarcodeFormat CurrentFormat
        {
            get => _currentFormat;
            set
            {
                _currentFormat = value;
                OnPropertyChanged();
            }
        }

        public string CurrentValue
        {
            get => _currentValue;
            set
            {
                _currentValue = value;
                OnPropertyChanged();
            }
        }

        public bool IsTorchOn
        {
            get => _isTorchOn;
            set
            {
                _isTorchOn = value;
                OnPropertyChanged();
            }
        }

        public CameraLocation CameraLocation
        {
            get => _cameraLocation;
            set
            {
                _cameraLocation = value;
                OnPropertyChanged();
            }
        }

       public async Task ProcessBarcode(BarcodeDetectionEventArgs e)
{
    if (_isProcessingBarcode) return;

    var first = e.Results?.FirstOrDefault();
    if (first is not null)
    {
        string barcode = first.Value;

        if (barcode == _lastScanBarcode) return;
        _lastScanBarcode = barcode;

        _isProcessingBarcode = true;
        try
        {
            if (barcode.StartsWith("020"))
            {
                        // Appel de votre fonction pour récupérer le lot associé
                        BatchModel? lot = await BatchModel.GetBatchByBarcodeAsync(barcode);

                await MainThread.InvokeOnMainThreadAsync(async () =>
                {
                    if (lot != null)
                    {
                        // Afficher les infos du lot, ou naviguer vers une page dédiée
                        await Application.Current.MainPage.DisplayAlert(
                            "Lot détecté",
                            $"Code LOT : {barcode}\nNom du lot : {lot.Barcode}\nAutre info : {lot.Code}",
                            "OK"
                        );
                        // Vous pouvez aussi ajouter le lot à une liste, etc.
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
                // Traitement normal pour les produits
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
}
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
            CurrentValue = "Bla";
            ResultLabel = "Top text...";
            ResultName = "Top text...";
            LastScanBarcode = null;
        }

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
    }
}
