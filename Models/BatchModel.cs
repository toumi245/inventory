using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using MySqlConnector;

namespace CodeABarre.Models
{
    public class BatchModel
    {
        // =====================
        // Properties
        // =====================
        public int Id { get; set; }
        public string Barcode { get; set; }
        public string Code { get; set; }
        public string ProductName { get; set; }
        public int ProductId { get; set; } 
        public decimal ActualStock { get; set; }
        // =====================
        // Static Fields
        // =====================
        private static ConnectionModel _connection;

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

        public static async Task<BatchModel?> GetBatchByBarcodeAsync(string barcode)
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            try
            {
                using var connection = new MySqlConnection(_connection.GetConnectionString());
                await connection.OpenAsync();

                var command = new MySqlCommand("SELECT id, code,product FROM commercial_batch WHERE barcode = @barcode LIMIT 1;", connection);
                command.Parameters.AddWithValue("@barcode", barcode);

                using var reader = await command.ExecuteReaderAsync();
                if (await reader.ReadAsync())
                {
                    return new BatchModel
                    {
                        Id = Convert.ToInt32(reader["id"]),
                        Barcode = barcode,
                        Code = reader.GetString("code"),
                        ProductId = reader["product"] == DBNull.Value ? 0 : Convert.ToInt32(reader["product"])
                    };
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erreur de base de données : {ex.Message}");
            }

            return null;
        }

        public static async Task<BatchModel?> GetBatchByNameAsync(string code)
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            var command = new MySqlCommand("SELECT id, barcode, code,product FROM commercial_batch WHERE code = @code LIMIT 1;", connection);
            command.Parameters.AddWithValue("@code", code);

            using var reader = await command.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new BatchModel
                {
                    Id = Convert.ToInt32(reader["id"]),
                    Barcode = reader["barcode"].ToString(),
                    Code = reader["code"].ToString(),
                    ProductId = reader["product"] == DBNull.Value ? 0 : Convert.ToInt32(reader["product"])
                };
            }

            return null;
        }

        public static async Task<List<string>> GetAllBatchAsync()
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            var batches = new List<string>();

            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            var command = new MySqlCommand("SELECT code FROM commercial_batch LIMIT 1000 OFFSET 1932;", connection);
            using var reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                batches.Add(reader[0].ToString());
            }

            return batches;
        }

        public static async Task<BatchModel?> GetBatchWithProductNameAsync(int batchId)
        {
            if (_connection == null)
                throw new InvalidOperationException("ConnectionModel is not set. Call SetConnection first.");

            using var connection = new MySqlConnection(_connection.GetConnectionString());
            await connection.OpenAsync();

            string query = @"
                SELECT b.id AS batch_id, b.code AS batch_code, b.product AS product_id, p.name AS product_name
                FROM commercial_batch b
                LEFT JOIN commercial_product p ON b.product = p.id
                WHERE b.id = @BatchId;
            ";

            using var cmd = new MySqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@BatchId", batchId);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new BatchModel
                {
                    Id = reader.GetInt32("batch_id"),
                    Code = reader.GetString("batch_code"),
                    ProductName = reader["product_name"] == DBNull.Value ? "Inconnu" : reader["product_name"].ToString(),
                    ProductId = reader["product_id"] == DBNull.Value ? 0 : Convert.ToInt32(reader["product_id"])
                };
            }

            return null;
        }

        // =====================
        // Session Storage
        // =====================
        public static class BatchSession
        {
            public static ObservableCollection<BatchModel> ScannedBatch { get; } = new();
        }
    }
}
