using CommunityToolkit.Maui.Views;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using CodeABarre.Models;
using MySqlConnector;
using CodeABarre.Helpers;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace CodeABarre.Views;

public partial class InventoryPopUp : Popup

{
    private static ConnectionModel _connection;
    public InventoryPopUp(ConnectionModel connection)
    {
		InitializeComponent();
         _connection = connection ?? throw new ArgumentNullException(nameof(connection));
        _ = LoadWarehousesAsync();
    }
    
    private async void OnAddClicked(object sender, EventArgs e)
    {
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
        if (WarehousePicker.SelectedItem is not Warehouse selectedWarehouse)
        {
            await Application.Current.MainPage.DisplayAlert("Validation", "Please select a warehouse.", "OK");
            return;
        }

        try
        {
            using var conn = new MySqlConnection(_connection.GetConnectionString());
            await conn.OpenAsync();

            var cmd = new MySqlCommand(@"
            INSERT INTO commercial_inventory (name, warehouse, reference, date, create_date, note)
            VALUES (@name, @warehouse, @reference, @date, @create_date, @note);
        ", conn);

            // Safe parameter assignment
            cmd.Parameters.AddWithValue("@name", nameToInsert);
            cmd.Parameters.AddWithValue("@warehouse", selectedWarehouse.Id); 
            cmd.Parameters.AddWithValue("@reference", reference);
            cmd.Parameters.AddWithValue("@date", date); // Date from DatePicker
            cmd.Parameters.AddWithValue("@create_date", createDate); // Automatically use current timestamp
            cmd.Parameters.AddWithValue("@note", note);

            await cmd.ExecuteNonQueryAsync();

            await Application.Current.MainPage.DisplayAlert("Success", " added to database.", "OK");

            // Reset fields
            NameEntry.Text = string.Empty;
            ReferenceEntry.Text = string.Empty;
            NoteEntry.Text = string.Empty;
            DatePicker.Date = DateTime.Today;
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
        }
    }
    private async Task LoadWarehousesAsync()
    {
        var warehouses = new List<Warehouse>();

        try
        {
            using var conn = new MySqlConnection(_connection.GetConnectionString());
            await conn.OpenAsync();

            var cmd = new MySqlCommand("SELECT id, name FROM commercial_warehouse", conn);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                warehouses.Add(new Warehouse
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1)
                });
            }

            WarehousePicker.ItemsSource = warehouses;
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
        }
    }
}