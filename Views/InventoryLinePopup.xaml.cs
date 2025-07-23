using CommunityToolkit.Maui.Views;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using CodeABarre.Models;
using MySqlConnector;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace CodeABarre.Views;
public partial class InventoryLinePopup : Popup
{
    private static ConnectionModel _connection;
    private int _warehouseId;
    private ProductModel _product;
    private int _realStock;
    private ProductPopup _parentPopup;
    private readonly Action<ProductModel> _onProductAddedToInventory;

    public InventoryLinePopup(ConnectionModel connection, int warehouseId, ProductModel product, int realStock,ProductPopup parentPopup, Action<ProductModel> onProductAddedToInventory)
    {
        InitializeComponent();
        _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        _warehouseId = warehouseId;
        _product = product ?? throw new ArgumentNullException(nameof(product));
        _realStock = realStock;
        _parentPopup = parentPopup;
    _onProductAddedToInventory = onProductAddedToInventory;
    WarehouseIdLabel.Text = warehouseId.ToString();
    }

    private async void OnAddClicked(object sender, EventArgs e)
    {
         // Récupération des valeurs
        string nameToInsert = NameEntry?.Text?.Trim();
        string reference = ReferenceEntry?.Text?.Trim() ?? string.Empty;
        string note = NoteEntry?.Text?.Trim() ?? string.Empty;
        DateTime date = DatePicker.Date;
        DateTime createDate = DateTime.Now;

        if (string.IsNullOrWhiteSpace(nameToInsert))
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Please enter a name.", "OK");
            return;
        }
        
        try
        {
            using var conn = new MySqlConnection(_connection.GetConnectionString());
            await conn.OpenAsync();
            // 1. Insérer dans commercial_inventory et récupérer l'id
            var cmdInventory = new MySqlCommand(@"
                INSERT INTO commercial_inventory (name, warehouse, reference, date, create_date, note)
            VALUES (@name, @warehouse, @reference, @date, @create_date, @note);
            SELECT LAST_INSERT_ID();
            ", conn);

            cmdInventory.Parameters.AddWithValue("@name", nameToInsert);
            cmdInventory.Parameters.AddWithValue("@warehouse", _warehouseId);
            cmdInventory.Parameters.AddWithValue("@reference", reference);
            cmdInventory.Parameters.AddWithValue("@date", date);
            cmdInventory.Parameters.AddWithValue("@create_date", createDate);
            cmdInventory.Parameters.AddWithValue("@note", note);

            // Exécuter et récupérer l'id de l'inventaire créé
            var inventoryIdObj = await cmdInventory.ExecuteScalarAsync();
            int inventoryId = Convert.ToInt32(inventoryIdObj);


            // 2. Insérer dans commercial_inventory_line
            var cmdLine = new MySqlCommand(@"
            INSERT INTO commercial_inventory_line (inventory, product, real_stock, theorical_real_stock)
            VALUES (@inventory, @product, @real_stock, @theorical_real_stock);
            ", conn);

            cmdLine.Parameters.AddWithValue("@inventory", inventoryId);
            cmdLine.Parameters.AddWithValue("@product", _product.Id);
            cmdLine.Parameters.AddWithValue("@real_stock", _realStock);
            cmdLine.Parameters.AddWithValue("@theorical_real_stock", _product.ActualStock);

            await cmdLine.ExecuteNonQueryAsync();

            await Application.Current.MainPage.DisplayAlert("Success", "Inventory and line added to database.", "OK");
            // Reset fields
            NameEntry.Text = string.Empty;
            ReferenceEntry.Text = string.Empty;
            NoteEntry.Text = string.Empty;
            DatePicker.Date = DateTime.Today;
            // Ferme d'abord le popup courant (InventoryLinePopup)
            this.Close();
            // Ferme ensuite le popup parent (ProductPopup)
            _parentPopup?.Close();
            // Supprime le produit de la liste via le callback
            _onProductAddedToInventory?.Invoke(_product);

        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
        }
    }

}