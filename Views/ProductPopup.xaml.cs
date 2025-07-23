using CommunityToolkit.Maui.Views;
using CodeABarre.Models;
using MySqlConnector;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace CodeABarre.Views;

public partial class ProductPopup : Popup
{
    private static ConnectionModel _connection;
    private readonly Action<ProductModel> _onProductAddedToInventory;
    private Warehouse _selectedWarehouseFromHome;
    private ProductModel _product;


    public ProductPopup(ProductModel product, ConnectionModel connection, Action<ProductModel> onProductAddedToInventory, Warehouse selectedWarehouseFromHome)
    {
        InitializeComponent();

        _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        _product = product ?? throw new ArgumentNullException(nameof(product));
        _onProductAddedToInventory = onProductAddedToInventory;
        _selectedWarehouseFromHome = selectedWarehouseFromHome;

        BindingContext = _product;

        _ = LoadInventoriesAsync();
    }

    // ==============================
    // Stock Check Logic
    // ==============================
    private void OnCheckStockClicked(object sender, EventArgs e)
    {
        if (decimal.TryParse(StockEntry.Text, out decimal enteredStock))
        {
            if (enteredStock > _product.ActualStock)
            {
                MessageLabel.Text = "⚠️ Entered stock exceeds available inventory.";
                MessageLabel.TextColor = Colors.Red;
            }
            else if (enteredStock == _product.ActualStock)
            {
                MessageLabel.Text = "✅ Entered stock matches inventory.";
                MessageLabel.TextColor = Colors.Green;
            }
            else
            {
                MessageLabel.Text = "ℹ️ Entered stock is below inventory.";
                MessageLabel.TextColor = Colors.Blue;
            }
        }
        else
        {
            MessageLabel.Text = "❌ Please enter a valid number.";
            MessageLabel.TextColor = Colors.OrangeRed;
        }
    }

    // ==============================
    // Load Inventories from DB
    // ==============================
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

    // ==============================
    // Add to Inventory Logic
    // ==============================
    private async void OnAddToInventoryClicked(object sender, EventArgs e)
    {
        await Application.Current.MainPage.DisplayAlert("Debug", $"_product.Id: {_product.Id}, Name: {_product.Name}", "OK");

        if (InventoryPicker.SelectedItem is not Inventory selectedInventory)
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Please select an inventory.", "OK");
            return;
        }

        if (_product == null)
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Product not found.", "OK");
            return;
        }

        if (!int.TryParse(StockEntry.Text, out int realStock))
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Enter a valid number for stock.", "OK");
            return;
        }

        try
        {
            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            var cmd = new MySqlCommand(@"
                INSERT INTO commercial_inventory_line (product, inventory, real_stock, theorical_real_stock)
                VALUES (@product, @inventory, @real_stock, @theorical_real_stock)
            ", connection);

            cmd.Parameters.AddWithValue("@product", _product.Id);
            cmd.Parameters.AddWithValue("@inventory", selectedInventory.Id);
            cmd.Parameters.AddWithValue("@real_stock", realStock);
            cmd.Parameters.AddWithValue("@theorical_real_stock", _product.ActualStock);

            await cmd.ExecuteNonQueryAsync();

            await Application.Current.MainPage.DisplayAlert("Success", "Inventory line added successfully.", "OK");
            _onProductAddedToInventory?.Invoke(_product);
            Close();
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
        }
    }

    // ==============================
    // Toggle Picker Visibility
    // ==============================
    private void OnShowInventoryCheckBoxChanged(object sender, CheckedChangedEventArgs e)
    {
        InventoryPickerContainer.IsVisible = e.Value;
        AddInventoryButton.IsVisible = !e.Value;
    }

    // ==============================
    // Show Add Inventory Popup
    // ==============================
    private void OnShowInventoryPopupClicked(object sender, EventArgs e)
    {
        int warehouseIdToPass = _selectedWarehouseFromHome?.Id ?? 0;
       


        if (warehouseIdToPass == 0)
        {
            Application.Current.MainPage.DisplayAlert("Erreur", "Veuillez sélectionner un entrepôt sur la page d'accueil.", "OK");
            return;
        }
         if (string.IsNullOrEmpty(StockEntry.Text) || !int.TryParse(StockEntry.Text, out int realStock))
        {
             Application.Current.MainPage.DisplayAlert("Attention", "Veuillez entrer une valeur de stock.", "OK");
            return;
        }
        if (Application.Current.MainPage is Page page)
        {
            var popup = new InventoryLinePopup(_connection, warehouseIdToPass,_product,realStock, this, _onProductAddedToInventory);
            page.ShowPopup(popup);
        }
        else
        {
            Application.Current.MainPage.DisplayAlert("Erreur", "Veuillez sélectionner un entrepôt.", "OK");
        }
    }
}
