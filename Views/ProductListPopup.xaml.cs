using CommunityToolkit.Maui.Views;
using System.Collections.Generic;
using Microsoft.Maui.Controls;
using CodeABarre.Models;
using CodeABarre.ViewModels;
using MySqlConnector;
using DevExpress.Maui.Editors;

namespace CodeABarre.Views;

public partial class ProductListPopup : Popup
{
    public IEnumerable<ProductModel> Products { get; }
    private static ConnectionModel _connection;
    private readonly Action<ProductModel> _onProductAddedToInventory;
    private ProductModel _product;


    public ProductListPopup(IEnumerable<ProductModel> products, ConnectionModel connection, Action<ProductModel> onProductAddedToInventory)
    {
        InitializeComponent();
        _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        BindingContext = new ProductListPopupViewModel(products);
        _ = LoadInventoriesAsync();
    }
    private async Task LoadInventoriesAsync()
    {
        var inventories = new List<Inventory>();

        try
        {
            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();


            var cmd = new MySqlCommand("SELECT id, name FROM commercial_inventory", connection);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                inventories.Add(new Inventory
                {
                    Id = Convert.ToInt32(reader["id"]),
                    Name = reader["name"].ToString()

                });
            }

            InventoryPicker.ItemsSource = inventories;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
    }
    private async void OnAddToInventoryClicked(object sender, EventArgs e)
    {
        if (InventoryPicker.SelectedItem is not Inventory selectedInventory)
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Please select an inventory.", "OK");
            return;
        }

        // Get selected products from the BindingContext (ViewModel)
        if (BindingContext is ProductListPopupViewModel viewModel)
        {
            var selectedProducts = viewModel.Products.Where(p => p.IsSelected).ToList();
            if (!selectedProducts.Any())
            {
                await Application.Current.MainPage.DisplayAlert("Validation", "Please select at least one product.", "OK");
                return;
            }

            try
            {
                using var connection = new MySqlConnection(_connection.GetConnectionString());
                await connection.OpenAsync();

                foreach (var product in selectedProducts)
                {
                    var cmd = new MySqlCommand(@"
                        INSERT INTO commercial_inventory_line (product, inventory, real_stock, theorical_real_stock)
                        VALUES (@product, @inventory, @real_stock, @theorical_real_stock)", connection);

                    cmd.Parameters.AddWithValue("@product", product.Id);
                    cmd.Parameters.AddWithValue("@inventory", selectedInventory.Id);
                    cmd.Parameters.AddWithValue("@real_stock", product.ActualStock); // Or set to 0 or another value as needed
                    cmd.Parameters.AddWithValue("@theorical_real_stock", product.ActualStock); // Or set to 0 or another value as needed

                    await cmd.ExecuteNonQueryAsync();
                }

                await Application.Current.MainPage.DisplayAlert("Success", "Selected products added to inventory successfully.", "OK");
                
                Close();
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }
    }
}

