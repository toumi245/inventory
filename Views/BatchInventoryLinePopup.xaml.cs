using CommunityToolkit.Maui.Views;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using CodeABarre.Models;
using MySqlConnector;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace CodeABarre.Views;
public partial class BatchInventoryLinePopup : Popup
{
    private static ConnectionModel _connection;
    private int _warehouseId;
    private ProductModel _product;
    private int _realStock;
    private BatchPopup _parentPopup;
    private readonly Action<BatchModel> _onBatchAddedToInventory;
    private BatchModel _batch;


    public BatchInventoryLinePopup(BatchModel batch, ConnectionModel connection, int warehouseId, ProductModel product, int realStock, BatchPopup parentPopup, Action<BatchModel> onBatchAddedToInventory)
    {
        InitializeComponent();
        _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        _warehouseId = warehouseId;
        _realStock = realStock;
        _batch = batch ?? throw new ArgumentNullException(nameof(batch));

        _parentPopup = parentPopup;
        _onBatchAddedToInventory = onBatchAddedToInventory;
        WarehouseIdLabel.Text = warehouseId.ToString();
    }

    private async void OnAddClicked(object sender, EventArgs e)
    {
        // R�cup�ration des valeurs
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
            // 1. Ins�rer dans commercial_inventory et r�cup�rer l'id
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

            // Ex�cuter et r�cup�rer l'id de l'inventaire cr��
            var inventoryIdObj = await cmdInventory.ExecuteScalarAsync();
            int inventoryId = Convert.ToInt32(inventoryIdObj);


            // 2. Ins�rer dans commercial_inventory_line
            var cmdLine = new MySqlCommand(@"
            INSERT INTO commercial_inventory_line (batch,inventory, real_stock,product)
            VALUES (@batch, @inventory,@real_stock,@product);
            ", conn);

            cmdLine.Parameters.AddWithValue("@batch", _batch.Id);
            cmdLine.Parameters.AddWithValue("@real_stock", _realStock);
            cmdLine.Parameters.AddWithValue("@product", _batch.ProductId);
            cmdLine.Parameters.AddWithValue("@inventory", inventoryId);

            await cmdLine.ExecuteNonQueryAsync();
            await Application.Current.MainPage.DisplayAlert("DEBUG", $"_batch.ActualStock = {_batch.ActualStock}", "OK");
            await Application.Current.MainPage.DisplayAlert("Success", "Inventory and line added to database.", "OK");
            // Reset fields
            NameEntry.Text = string.Empty;
            ReferenceEntry.Text = string.Empty;
            NoteEntry.Text = string.Empty;
            DatePicker.Date = DateTime.Today;
             // Supprime le produit de la liste via le callback
            _onBatchAddedToInventory?.Invoke(_batch);

            // Ferme d'abord le popup courant (InventoryLinePopup)
            this.Close();
            // Ferme ensuite le popup parent (ProductPopup)
            _parentPopup?.Close();
          
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
        }
    }

}