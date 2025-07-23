using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using MySqlConnector;

namespace CodeABarre.Models
{
    public class ProductModel
    {
        // =====================
        // Properties
        // =====================
        public int Id { get; set; }
        public string Barcode { get; set; }
        public string Name { get; set; }
        public decimal ActualStock { get; set; }

        // =====================
        // Static Fields
        // =====================
        private static ConnectionModel _connection;
        private static readonly object _lock = new object();

        // =====================
        // Connection Management
        // =====================
        public static void SetConnection(ConnectionModel connection)
        {
            _connection = connection;
        }

        public static ConnectionModel GetConnection()
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");
            return _connection;
        }

        // =====================
        // Database Methods
        // =====================

        public static async Task<ProductModel?> GetByNameAsync(string name)
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            var command = new MySqlCommand("SELECT id, barcode, name, actual_stock FROM commercial_product WHERE name = @name LIMIT 1;", connection);
            command.Parameters.AddWithValue("@name", name);

            using var reader = await command.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new ProductModel
                {
                    Id = Convert.ToInt32(reader["id"]),
                    Barcode = reader["barcode"].ToString(),
                    Name = reader["name"].ToString(),
                    ActualStock = Convert.ToDecimal(reader["actual_stock"])
                };
            }

            return null;
        }

        public static async Task<ProductModel?> GetByBarcodeAsync(string barcode)
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            try
            {
                using var connection = new MySqlConnection(_connection.GetConnectionString());
                await connection.OpenAsync();

                var command = new MySqlCommand("SELECT id, name, actual_stock FROM commercial_product WHERE barcode = @barcode LIMIT 1;", connection);
                command.Parameters.AddWithValue("@barcode", barcode);

                using var reader = await command.ExecuteReaderAsync();
                if (await reader.ReadAsync())
                {
                    return new ProductModel
                    {
                        Id = Convert.ToInt32(reader["id"]),
                        Barcode = barcode,
                        Name = reader.GetString("name"),
                        ActualStock = reader.GetDecimal("actual_stock")
                    };
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erreur de base de données : {ex.Message}");
            }

            return null;
        }

        public static async Task<List<string>> GetAllNamesAsync()
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            var names = new List<string>();

            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            var command = new MySqlCommand("SELECT name FROM commercial_product LIMIT 200;", connection);
            using var reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                names.Add(reader[0].ToString());
            }

            return names;
        }
    }

    // ====================================
    // Session Storage (Scanned Products)
    // ====================================
    public static class ProductSession
    {
        public static ObservableCollection<ProductModel> ScannedProducts { get; } = new();
    }
}
