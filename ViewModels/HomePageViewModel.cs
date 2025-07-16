using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.Maui.Controls;
using CodeABarre.Models;        
using CodeABarre.Views;
using System.Windows.Input;
using CommunityToolkit.Maui.Views;
using System.ComponentModel;
namespace CodeABarre.ViewModels
{
    public class HomePageViewModel : INotifyPropertyChanged
    {
        private string _selectedProductName = string.Empty;
        private string _selectedBatchName = string.Empty;

        private ObservableCollection<string> _productNames = new();
        private ObservableCollection<string> _batchNames = new();

        private readonly ConnectionModel _connection;
        public ObservableCollection<ProductModel> Products { get; }
        public static Warehouse LastSelectedWarehouse { get; set; }

        public Warehouse SelectedWarehouse
        {
            get => _selectedWarehouse;
            set
            {
                _selectedWarehouse = value;
                LastSelectedWarehouse = value;
                OnPropertyChanged(nameof(SelectedWarehouse));
            }
        }
        public ObservableCollection<BatchModel> ScannedLots { get; set; }
        public ObservableCollection<Warehouse> Warehouses { get; set; } = new();
        private Warehouse _selectedWarehouse;

        public ObservableCollection<string> ProductNames
        {
            get => _productNames;
            set
            {
                _productNames = value;
                OnPropertyChanged(nameof(ProductNames));
            }
        }
        public ObservableCollection<string> BatchNames
        {
            get => _batchNames;
            set
            {
                _batchNames = value;
                OnPropertyChanged(nameof(BatchNames));
            }
        }
        public string SelectedProductName
        {
            get => _selectedProductName;
            set
            {
                _selectedProductName = value;
                OnPropertyChanged(nameof(SelectedProductName));
            }
        }
        public string SelectedBatchName
        {
            get => _selectedBatchName;
            set
            {
                _selectedBatchName = value;
                OnPropertyChanged(nameof(SelectedBatchName));
            }
        }
        public ICommand AddProductCommand { get; }
        public ICommand AddBatchCommand { get; }
        public ICommand DeleteProductCommand { get; }
        public ICommand DeleteBatchCommand { get; }
        private Action<string> _deleteCallback;

        public HomePageViewModel(ObservableCollection<ProductModel> products, Action<string> deleteCallback, ConnectionModel connection, Warehouse selectedWarehouse = null)
        {
            Products = products;
            _deleteCallback = deleteCallback;
            _connection = connection ?? throw new ArgumentNullException(nameof(connection));
            ScannedLots = new ObservableCollection<BatchModel>(); 
            AddProductCommand = new Command(async () => await AddProduct());
            AddBatchCommand = new Command(async () => await AddBatch());

            DeleteProductCommand = new Command<ProductModel>(async (product) => await DeleteProductAsync(product));
            DeleteBatchCommand = new Command<BatchModel>(async(lot)=>await DeleteBatchAsync(lot) );            
            LoadProductNamesAsync();
            LoadBatchNamesAsync();
            Warehouses = new ObservableCollection<Warehouse>();
            LoadWarehousesAsync();
            SelectedWarehouse = selectedWarehouse;
        }

        public async Task DeleteProductAsync(ProductModel product)
        {
            if (Products.Contains(product))
            {
                bool confirm = await Application.Current.MainPage.DisplayAlert(
                    "Confirm Deletion",
                    $"Do you really want to delete '{product.Name}'?",
                    "Yes", "No");

                if (confirm)
                {
                    Products.Remove(product);
                    _deleteCallback?.Invoke(product.Barcode);
                }
            }
        }
        public async Task DeleteBatchAsync(BatchModel lot)
        {
            if (ScannedLots.Contains(lot))
            {
                bool confirm = await Application.Current.MainPage.DisplayAlert(
                    "Confirm Deletion",
                    $"Do you really want to delete '{lot.Code}'?",
                    "Yes", "No");

                if (confirm)
                {
                    ScannedLots.Remove(lot);
                    _deleteCallback?.Invoke(lot.Barcode);
                }
            }
        }
        
        public async Task AddProduct()
        {
            if (string.IsNullOrEmpty(SelectedProductName))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please select a product name.", "OK");
                return;
            }

            try
            {
                var product = await ProductModel.GetByNameAsync(SelectedProductName);

                if (product != null && !Products.Any(p => p.Barcode == product.Barcode))
                {
                    Products.Add(product);
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }
        public async Task AddBatch()
        {
            if (string.IsNullOrEmpty(SelectedBatchName))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please select a Batch name.", "OK");
                return;
            }

            try
            {
                var lot = await BatchModel.GetBatchByNameAsync(SelectedBatchName);

                if (lot != null && !ScannedLots.Any(p => p.Barcode == lot.Barcode))
                {
                    // Récupère le batch avec le nom du produit
                    var batchWithProductName = await BatchModel.GetBatchWithProductNameAsync(lot.Id);
                    if (batchWithProductName != null)
                        ScannedLots.Add(batchWithProductName);
                    else
                        ScannedLots.Add(lot);
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }
        public async Task LoadProductNamesAsync()
        {
            try
            {
                IsLoading = true;
                OnPropertyChanged(nameof(IsLoading));
                var names = await ProductModel.GetAllNamesAsync();
                ProductNames.Clear();
                foreach (var name in names)
                    ProductNames.Add(name);
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert(
                    "Erreur de connexion",
                    $"Impossible de charger les produits. Vérifiez la connexion à la base de données.\nDétail : {ex.Message}",
                    "Réessayer");
            }
            finally
            {
                IsLoading = false;
                OnPropertyChanged(nameof(IsLoading));
            }
        }
        private async void LoadWarehousesAsync()
            {
                try
                {
                     Warehouse.SetConnection(ProductModel.GetConnection());
                    var warehouses = await Warehouse.GetAllWarehousesAsync();
                    Warehouses.Clear();
                    foreach (var w in warehouses)
                        Warehouses.Add(w);
                }
                catch (Exception ex)
                {
                await Application.Current.MainPage.DisplayAlert(
                "Erreur de connexion",
                $"Impossible de charger les lots. Vérifiez la connexion à la base de données.\nDétail : {ex.Message}",
                "Réessayer");
            }
            }
        public async Task LoadBatchNamesAsync()
        {
            try
            {
                IsLoading = true;
                OnPropertyChanged(nameof(IsLoading));
                var lots = await BatchModel.GetAllBatchAsync();
                
                foreach (var lot in lots)
                    BatchNames.Add(lot);
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert(
                    "Erreur de connexion",
                    $"Impossible de charger les lots. Vérifiez la connexion à la base de données.\nDétail : {ex.Message}",
                    "Réessayer");
            }
            finally
            {
                IsLoading = false;
                OnPropertyChanged(nameof(IsLoading));
            }
        }
        public async Task ShowProductPopup(ProductModel product, Warehouse selectedWarehouse)
        {
            if (Application.Current.MainPage is Page page)
            {
                var popup = new ProductPopup(product, _connection, (p) => Products.Remove(p),selectedWarehouse);
                await page.ShowPopupAsync(popup);
            }
        }
        public async Task ShowBatchPopup(BatchModel batch, Warehouse selectedWarehouse)
        {
            if (Application.Current.MainPage is Page page)
            {
                var popup = new BatchPopup(batch, _connection,(p) => ScannedLots.Remove(p), selectedWarehouse);
                await page.ShowPopupAsync(popup);
            }
        }
        public void ShowInventoryPopup()
        {
            if (Application.Current.MainPage is Page page)
    {
        if (SelectedWarehouse != null)
        {
            var popup = new InventoryPopUp(_connection, SelectedWarehouse.Id);
            page.ShowPopup(popup);
        }
        else
        {
            Application.Current.MainPage.DisplayAlert("Erreur", "Veuillez sélectionner un entrepôt.", "OK");
        }
    }
        }
        private bool _isLotChecked;
    public bool IsLotChecked
    {
        get => _isLotChecked;
        set
        {
            if (_isLotChecked != value)
            {
                _isLotChecked = value;
                OnPropertyChanged(nameof(IsLotChecked));
            }
        }
    }
    private bool _isProduitChecked;
    public bool IsProduitChecked
    {
        get => _isProduitChecked;
        set
        {
            if (_isProduitChecked != value)
            {
                _isProduitChecked = value;
                OnPropertyChanged(nameof(IsProduitChecked));
            }
        }
    }
    public bool IsLoading { get; set; }
    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged(string propertyName) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
} 