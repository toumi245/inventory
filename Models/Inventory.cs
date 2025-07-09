using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeABarre.Models
{
    public class Inventory
    {
        private static ConnectionModel _connection;

        public int Id { get; set; }
        public string Name { get; set; }

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
    }
}
