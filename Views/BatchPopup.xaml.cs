using CommunityToolkit.Maui.Views;
using CodeABarre.Models;
using MySqlConnector;

namespace CodeABarre.Views;

public partial class BatchPopup : Popup
{
    private static ConnectionModel _connection;
    private readonly Action<BatchModel> _onBatchAddedToInventory;
    private Warehouse _selectedWarehouseFromHome;
    private BatchModel _batch;
    private int _realStock;
    private ProductModel _product;

    public BatchPopup(BatchModel batch, ConnectionModel connection, Action<BatchModel> onBatchAddedToInventory, Warehouse selectedWarehouseFromHome)
    {
        InitializeComponent();

        _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        _batch = batch ?? throw new ArgumentNullException(nameof(batch));
        _onBatchAddedToInventory = onBatchAddedToInventory;
        _selectedWarehouseFromHome = selectedWarehouseFromHome;
      //  _realStock = realStock;

        BindingContext = _batch;

        _ = LoadInventoriesAsync();
    }

    // ==============================
    // Stock Check Logic
    // ==============================
    private void OnCheckStockClicked(object sender, EventArgs e)
    {
        if (decimal.TryParse(StockEntry.Text, out decimal enteredStock))
        {
            // Ici, vous pouvez ajouter une logique spécifique pour les lots si besoin
            MessageLabel.Text = $"Quantité entrée : {enteredStock}";
            MessageLabel.TextColor = Colors.Blue;
        }
        else
        {
            MessageLabel.Text = "❌ Veuillez entrer un nombre valide.";
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
    private async void OnAddToInventoryLineClicked(object sender, EventArgs e)
    {
        await Application.Current.MainPage.DisplayAlert("Debug", $"_batch.Id: {_batch.Id}, Code: {_batch.Code}", "OK");
        await Application.Current.MainPage.DisplayAlert("DEBUG", $"ProductId: {_batch.ProductId}", "OK");
		if (InventoryPicker.SelectedItem is not Inventory selectedInventory)
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Veuillez sélectionner un inventaire.", "OK");
            return;
        }

        if (_batch == null)
        {
            await Application.Current.MainPage.DisplayAlert("Erreur", "Lot non trouvé.", "OK");
            return;
        }

        if (!int.TryParse(StockEntry.Text, out int realStock))
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Entrez un nombre valide pour le stock.", "OK");
            return;
        }

        try
        {
            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            var cmd = new MySqlCommand(@"
                INSERT INTO commercial_inventory_line (batch, inventory, real_stock,product)
                VALUES (@batch, @inventory, @real_stock,@product)
            ", connection);

            cmd.Parameters.AddWithValue("@batch", _batch.Id);
            cmd.Parameters.AddWithValue("@inventory", selectedInventory.Id);
            cmd.Parameters.AddWithValue("@real_stock", realStock);
			cmd.Parameters.AddWithValue("@product", _batch.ProductId);

            await cmd.ExecuteNonQueryAsync();

            await Application.Current.MainPage.DisplayAlert("Succès", "Ligne d'inventaire ajoutée avec succès.", "OK");
            _onBatchAddedToInventory?.Invoke(_batch);
            Close();
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Erreur", ex.Message, "OK");
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
    private void OnAddInventoryAndInventorylineClicked(object sender, EventArgs e)
{
    int warehouseIdToPass = _selectedWarehouseFromHome?.Id ?? 0;

    if (warehouseIdToPass == 0)
    {
        Application.Current.MainPage.DisplayAlert("Erreur", "Veuillez sélectionner un entrepôt sur la page d'accueil.", "OK");
        return;
    }
    if (Application.Current.MainPage is Page page)
    {

        // Ouvre le popup d’inventaire APRÈS une petite attente (sinon bug Android)
        Device.BeginInvokeOnMainThread(async () =>
        {
            
            await Task.Delay(200); // 200ms pour laisser le temps de fermer
            int.TryParse(StockEntry.Text, out int realStock);

            var popup = new BatchInventoryLinePopup(_batch,
                                                _connection,
                                                warehouseIdToPass,
                                                _product,
                                                realStock,
                                                this,
                                                _onBatchAddedToInventory);
        
            await page.ShowPopupAsync(popup);
        });
    }
    else
    {
        Application.Current.MainPage.DisplayAlert("Erreur", "Veuillez sélectionner un entrepôt.", "OK");
    }
}
}