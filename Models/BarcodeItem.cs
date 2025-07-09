using System.Diagnostics;
using ZXing.QrCode.Internal;

namespace CodeABarre.Models;

public class BarcodeItem
{
   public string OriginalText { get; set; }
    public string Type { get; set; }
    public string Value { get; set; }  // New property for the barcode number
    public string DisplayText => $"{Type}: {Value}";

    public BarcodeItem(string barcodeText)
    {
        OriginalText = barcodeText;

      
        var parts = barcodeText.Split(':');
        if (parts.Length >= 2)
        {
            Type = parts[0].Trim();
            Value = parts[1].Trim();
            
        }
        else
        {
            Type = "Unknown";
            Value = barcodeText.Trim();
        }
    }

}