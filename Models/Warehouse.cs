using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySqlConnector;

namespace CodeABarre.Models
{
    public class Warehouse
    {
        public int Id { get; set; }
        public string Name { get; set; }
        private static ConnectionModel _connection;

        // This controls what appears in the Picker
        public override string ToString() => Name;

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
        public static async Task<List<Warehouse>> GetAllWarehousesAsync()
        {
            var warehouses = new List<Warehouse>();

            try
            {
                using var conn = new MySqlConnection(_connection.GetConnectionString());
                await conn.OpenAsync();

                var cmd = new MySqlCommand("SELECT id, name FROM commercial_warehouse ", conn);
                cmd.CommandTimeout = 60;
                using var reader = await cmd.ExecuteReaderAsync();

                while (await reader.ReadAsync())
                {
                    warehouses.Add(new Warehouse
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    });
                }

            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
            return warehouses;
        }
    }

}
