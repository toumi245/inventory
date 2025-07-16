using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using CommunityToolkit.Maui.Views;
using CodeABarre.Models;
using CodeABarre.ViewModels;

namespace CodeABarre.Views
{
    public partial class HomePage : ContentPage
    {
        private readonly HomePageViewModel _viewModel;
        private bool _shouldActivateLotSwitch = false;

        public HomePage()
        {
            InitializeComponent();

            var products = new ObservableCollection<ProductModel>();
            Action<string> deleteCallback = (productId) =>
            {
                // Logique de suppression
                Console.WriteLine($"Product {productId} deleted");
            };

            _viewModel = new HomePageViewModel(products, deleteCallback, ProductModel.GetConnection());
            BindingContext = _viewModel;
        }

        public HomePage(ObservableCollection<ProductModel> products, Action<string> deleteCallback, ObservableCollection<BatchModel> scannedLots, Warehouse selectedWarehouse = null)
        {
            InitializeComponent();

            _viewModel = new HomePageViewModel(products, deleteCallback, ProductModel.GetConnection(), selectedWarehouse);
            _viewModel.ScannedLots = scannedLots;
            BindingContext = _viewModel;
        }

        public void ActivateLotSwitchOnAppear()
        {
            _shouldActivateLotSwitch = true;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();

            if (_shouldActivateLotSwitch)
            {
                LotProduitSwitch.IsToggled = true;
                _shouldActivateLotSwitch = false;
            }
        }

        public Switch GetLotProduitSwitch() => LotProduitSwitch;

        private void OnLotProduitSwitchToggled(object sender, ToggledEventArgs e)
        {
            LotProduitLabel.Text = e.Value ? "LOT" : "PRODUIT";

            var produitContent = this.FindByName<Grid>("ProduitContent");
            var lotContent = this.FindByName<Grid>("LotContent");

            if (e.Value)
            {
                if (produitContent != null) produitContent.IsVisible = false;
                if (lotContent != null) lotContent.IsVisible = true;
            }
            else
            {
                if (produitContent != null) produitContent.IsVisible = true;
                if (lotContent != null) lotContent.IsVisible = false;
            }
        }

        private void OnProductTapped(object sender, EventArgs e)
        {
            try
            {
                if (sender is Frame frame && frame.BindingContext is ProductModel product)
                {
                    _viewModel.ShowProductPopup(product, _viewModel.SelectedWarehouse);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        private async void OnBatchTapped(object sender, EventArgs e)
        {
            try
            {
                if (sender is Frame frame && frame.BindingContext is BatchModel batch)
                {
                    _viewModel.ShowBatchPopup(batch, _viewModel.SelectedWarehouse);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        private void FloatingButton_Clicked(object sender, EventArgs e)
        {
            try
            {
                _viewModel.ShowInventoryPopup();
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        private void OnShowAllProductsClicked(object sender, EventArgs e)
        {
            var products = _viewModel.Products.ToList();
            var connection = ProductModel.GetConnection();
            var popup = new ProductListPopup(products, connection, product =>
            {
                _viewModel.Products.Remove(product);
            });
            this.ShowPopup(popup);
        }

        private async void OnCameraButtonClicked(object sender, EventArgs e)
        {
            try
            {
                await Navigation.PushAsync(new MainPage());
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }
    }
}
