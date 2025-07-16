using System;
using System.Linq;
using Microsoft.Maui.Controls;
using ZXing.Net.Maui;
using ZXing.Net.Maui.Controls;
using CodeABarre.Views;
using System.Collections.Generic;
using System.Text;
using MySqlConnector;
using System.Threading.Tasks; // Pour StringBuilder
using CodeABarre.Models;
using System.Collections.ObjectModel;
using CodeABarre.ViewModels;
using Plugin.Maui.Audio;
using Microsoft.Maui.Devices;
using CommunityToolkit.Maui.Views;
namespace CodeABarre
{
    public partial class MainPage : ContentPage
    {
        private readonly MainViewModel _viewModel;
        private IAudioManager _audioManager = AudioManager.Current;
        private IAudioPlayer? _player;
        private IDispatcherTimer? _loadingTimer;
        private ContentView? _loadingOverlay;
        private View? _originalContent; // Ajout pour stocker le contenu d'origine

        public MainPage()
        {
            InitializeComponent();
            _viewModel = new MainViewModel();
            BindingContext = _viewModel;
            _originalContent = this.Content; // Stocke le contenu d'origine

            barcodeView.HandlerChanged += (s, e) =>
            {
                barcodeView.IsDetecting = true;
                barcodeView.CameraLocation = _viewModel.CameraLocation;
            };

            barcodeView.Options = new BarcodeReaderOptions
            {
                Formats = BarcodeFormat.Ean13 | BarcodeFormat.QrCode,
                AutoRotate = true,
                Multiple = true
            };
        }

        private void ShowLoading()
        {
            MainThread.BeginInvokeOnMainThread(() =>
            {
                if (_loadingOverlay == null)
                {
                    var activityIndicator = new ActivityIndicator
                    {
                        IsRunning = true,
                        Color = Colors.White,
                        HorizontalOptions = LayoutOptions.Center,
                        VerticalOptions = LayoutOptions.Center
                    };

                    var loadingLabel = new Label
                    {
                        Text = "Recherche du produit...",
                        TextColor = Colors.White,
                        HorizontalOptions = LayoutOptions.Center,
                        Margin = new Thickness(0, 10, 0, 0)
                    };

                    var stackLayout = new VerticalStackLayout
                    {
                        Children = { activityIndicator, loadingLabel },
                        HorizontalOptions = LayoutOptions.Center,
                        VerticalOptions = LayoutOptions.Center,
                        Spacing = 10
                    };

                    _loadingOverlay = new ContentView
                    {
                        Content = stackLayout,
                        BackgroundColor = new Color(0, 0, 0, 7),
                        IsVisible = true
                    };

                    this.Content = new Grid
                    {
                        Children =
                        {
                            _originalContent, // Utilise le contenu d'origine
                            _loadingOverlay
                        }
                    };
                }
                else
                {
                    _loadingOverlay.IsVisible = true;
                }
            });
        }

        private void HideLoading()
        {
            MainThread.BeginInvokeOnMainThread(() =>
            {
                if (_loadingOverlay != null)
                {
                    _loadingOverlay.IsVisible = false;
                }
            });
        }

        private async void BarcodesDetected(object sender, BarcodeDetectionEventArgs e)
        {
            // Early exit if already processing or no valid barcode
            if (_viewModel.IsProcessingBarcode || e.Results?.FirstOrDefault() is not BarcodeResult first)
                return;

            string barcode = first.Value;

            // Skip duplicate scans
            if (barcode == _viewModel.LastScanBarcode)
                return;

            // Lock processing
            _viewModel.IsProcessingBarcode = true;
            _viewModel.LastScanBarcode = barcode;

            try
            {
                // 1. Play sound in background (fire-and-forget)
                _ = Task.Run(async () =>
                {
                    try
                    {
                        using var stream = await FileSystem.OpenAppPackageFileAsync("beep.mp3");
                        var player = AudioManager.Current.CreatePlayer(stream);
                        player.Play();
                    }
                    catch { /* Suppress sound errors */ }
                });

                // Vibrate for 200ms
                try { Vibration.Vibrate(200); } catch { /* Ignore vibration errors */ }

                // 2. Immediate UI update (non-blocking)
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    barcodeGenerator.ClearValue(BarcodeGeneratorView.ValueProperty);
                    barcodeGenerator.Format = first.Format;
                    barcodeGenerator.Value = barcode;
                    _viewModel.ResultLabel = $"Code scanné: {barcode}";
                });

                // Show loading spinner
                ShowLoading();

                // --- Ajout détection LOT ---
                if (barcode.StartsWith("020"))
                {
                    // Récupère le lot avec le nom du produit associé
                    BatchModel lot = await BatchModel.GetBatchByBarcodeAsync(barcode);
                    HideLoading();
                    await MainThread.InvokeOnMainThreadAsync(async () =>
                    {
                        if (lot != null)
                        {
                            // Récupère le lot avec le nom du produit
                            var lotWithProduct = await BatchModel.GetBatchWithProductNameAsync(lot.Id);

                            if (lotWithProduct != null)
                            {
                                await DisplayAlert("Lot détecté", $"Code LOT : {barcode}\nNom du lot : {lot.Code}\nProduit : {lotWithProduct.ProductName}", "OK");
                                // Ajoute le lot avec le nom du produit à la collection
                                if (!BatchModel.BatchSession.ScannedBatch.Any(b => b.Barcode == lot.Barcode))
                                {
                                    BatchModel.BatchSession.ScannedBatch.Add(lotWithProduct);
                                }
                            }
                            else
                            {
                                await DisplayAlert("Lot détecté", $"Code LOT : {barcode}\nNom du lot : {lot.Code}\nProduit : Inconnu", "OK");
                                // Ajoute le lot sans nom de produit
                                if (!BatchModel.BatchSession.ScannedBatch.Any(b => b.Barcode == lot.Barcode))
                                {
                                    BatchModel.BatchSession.ScannedBatch.Add(lot);
                                }
                            }

                            var homePage = new HomePage(
                                ProductSession.ScannedProducts,
                                barcodeToDelete =>
                                {
                                    var item = ProductSession.ScannedProducts.FirstOrDefault(p => p.Barcode == barcodeToDelete);
                                    if (item != null)
                                    {
                                        ProductSession.ScannedProducts.Remove(item);
                                    }
                                },
                                BatchModel.BatchSession.ScannedBatch,
                                HomePageViewModel.LastSelectedWarehouse
                            );
                            homePage.ActivateLotSwitchOnAppear();
                            await Navigation.PushAsync(homePage, animated: false);
                            await Task.Delay(100);
                            // Active le switch sur "LOT" après navigation
                            Device.BeginInvokeOnMainThread(() =>
                            {
                                homePage.GetLotProduitSwitch().IsToggled = true;
                            });
                            // Ouvre automatiquement le BatchPopup pour le lot scanné
                            await Task.Delay(50); // Laisse le temps à la page de s'afficher
                            if (homePage.BindingContext is HomePageViewModel vm && lotWithProduct != null)
                            {
                                await vm.ShowBatchPopup(lotWithProduct, vm.SelectedWarehouse);
                            }
                        }
                        else
                        {
                            await DisplayAlert("Lot non trouvé", $"Aucun lot trouvé pour le code : {barcode}", "OK");
                        }
                    });
                }
                else
                {
                    // 3. Async product lookup
                    var product = await ProductModel.GetByBarcodeAsync(barcode);

                    // Hide loading and process results
                    HideLoading();

                    await MainThread.InvokeOnMainThreadAsync(async () =>
                    {
                        if (product != null)
                        {
                            _viewModel.ResultName = $"{product.Name} (Stock: {product.ActualStock})";

                            // Add to scanned products if not already present
                            if (!ProductSession.ScannedProducts.Any(p => p.Barcode == product.Barcode))
                            {
                                ProductSession.ScannedProducts.Add(product);
                            }

                            // Crée la HomePage, navigue, attend, puis ouvre le popup produit
                            var homePage = new HomePage(
                                ProductSession.ScannedProducts,
                                barcodeToDelete =>
                                {
                                    var item = ProductSession.ScannedProducts.FirstOrDefault(p => p.Barcode == barcodeToDelete);
                                    if (item != null)
                                    {
                                        ProductSession.ScannedProducts.Remove(item);
                                    }
                                },
                                BatchModel.BatchSession.ScannedBatch,
                                HomePageViewModel.LastSelectedWarehouse
                            );

                            await Navigation.PushAsync(homePage, animated: false);
                            await Task.Delay(100); // Laisse le temps à la page de s'afficher

                            if (homePage.BindingContext is HomePageViewModel vm && product != null)
                            {
                                await vm.ShowProductPopup(product, vm.SelectedWarehouse);
                            }
                        }
                        else
                        {
                            await DisplayAlert("Erreur", "Produit non trouvé dans la base de données", "OK");
                        }
                    });
                }
            }
            catch (Exception ex)
            {
                HideLoading();
                await MainThread.InvokeOnMainThreadAsync(() =>
                    DisplayAlert("Error", $"Scan failed: {ex.Message}", "OK"));
            }
            finally
            {
                // Minimal debounce delay (100ms)
                await Task.Delay(100);
                _viewModel.IsProcessingBarcode = false;
            }
        }

        void SwitchCameraButton_Clicked(object sender, EventArgs e)
        {
            _viewModel.SwitchCamera();
            barcodeView.CameraLocation = _viewModel.CameraLocation;
        }

        void TorchButton_Clicked(object sender, EventArgs e)
        {
            _viewModel.ToggleTorch();
            barcodeView.IsTorchOn = _viewModel.IsTorchOn;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            _viewModel.Reset();

            // Force camera reset workaround
            Dispatcher.Dispatch(async () =>
            {
                barcodeView.IsDetecting = false;

                // Force toggle to front and back
                barcodeView.CameraLocation = CameraLocation.Front;
                await Task.Delay(300); // give it time to reinitialize
                barcodeView.CameraLocation = CameraLocation.Rear;
                barcodeView.IsDetecting = true;
            });
        }

        protected override void OnDisappearing()
        {
            base.OnDisappearing();
            barcodeView.IsDetecting = false;
        }

        private void ResetButton_Clicked(object sender, EventArgs e)
        {
            _viewModel.Reset();
            barcodeGenerator.ClearValue(BarcodeGeneratorView.ValueProperty);
        }
    }
}
