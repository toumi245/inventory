using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CodeABarre.Models;
using System.ComponentModel;
using System.Collections.ObjectModel;
namespace CodeABarre.ViewModels
{
    public class SelectableProductModel : ProductModel, INotifyPropertyChanged
    {
        private bool _isSelected;
        private int _realStock;
        public int realStock
        {
            get => _realStock;
            set
            {
                _realStock = value;
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(IsSelected)));    }
        }
        public bool IsSelected
        {
            get => _isSelected;
            set
            {
                if (_isSelected != value)
                {
                    _isSelected = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(IsSelected)));
                }
            }
        }
        public event PropertyChangedEventHandler PropertyChanged;
    }

    public class ProductListPopupViewModel
    {
        public ObservableCollection<SelectableProductModel> Products { get; }
        public ProductListPopupViewModel(IEnumerable<ProductModel> products)
        {
            Products = new ObservableCollection<SelectableProductModel>(products.Select(p => new SelectableProductModel
            {
                Id = p.Id,
                Name = p.Name,
                ActualStock = p.ActualStock
            }));
        }
    }
}
