using CodeABarre.Models;

namespace CodeABarre
{
    public partial class App : Application
    {
        public App()
        {
            try
            {
                InitializeComponent();

                var myConnection = new ConnectionModel
                {
                    Server = "192.168.137.33",
                    Port = 3306,
                    Database = "batch_test_workman",
                    User = "root",
                    Password = "",
                    ConnectTimeout = 60
                };
                ProductModel.SetConnection(myConnection);
                BatchModel.SetConnection(myConnection); 
                Warehouse.SetConnection(myConnection);
                MainPage = new AppShell();
            }

            catch (Exception ex)
            {
                // Handle initialization errors if necessary
                Console.WriteLine($"Initialization error: {ex.Message}");
            }
        }
    }
}
