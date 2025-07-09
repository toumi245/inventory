using System.Collections.Generic;
using Microsoft.Maui.Controls;
using CodeABarre.Models;
using System.Windows.Input;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using CommunityToolkit.Maui.Views;
using CodeABarre.ViewModels;

namespace CodeABarre.Views;

public partial class HomePage : ContentPage
{
    private readonly HomePageViewModel _viewModel;
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
    private bool _shouldActivateLotSwitch = false;
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
    public HomePage(ObservableCollection<ProductModel> products, Action<string> deleteCallback, ObservableCollection<BatchModel> scannedLots)
    {
        InitializeComponent();
        _viewModel = new HomePageViewModel(products, deleteCallback, ProductModel.GetConnection());
        _viewModel.ScannedLots = scannedLots; 
        BindingContext = _viewModel;
    }
    private void OnLotProduitSwitchToggled(object sender, ToggledEventArgs e)
    {
        // Update the label text
        LotProduitLabel.Text = e.Value ? "LOT" : "PRODUIT";

        // Find the content grids by name
        var produitContent = this.FindByName<Grid>("ProduitContent");
        var lotContent = this.FindByName<Grid>("LotContent");

        // Toggle between the two contents
        if (e.Value)
        {
            // Switch is ON - Show LOT content
            if (produitContent != null) produitContent.IsVisible = false;
            if (lotContent != null) lotContent.IsVisible = true;
        }
        else
        {
            // Switch is OFF - Show PRODUIT content
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
                _viewModel.ShowProductPopup(product);
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
        var connection = ProductModel.GetConnection(); // Retrieve the connection

        var popup = new ProductListPopup(products, connection, product =>
        {
            // Remove the product from the ObservableCollection
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