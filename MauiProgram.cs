using Microsoft.Extensions.Logging;
using ZXing.Net.Maui.Controls; 
using ZXing.Net.Maui;
using CommunityToolkit.Maui;
using DevExpress.Maui;
namespace CodeABarre
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseDevExpress()
                .UseDevExpressCollectionView()
            .UseDevExpressControls()
            .UseDevExpressDataGrid()
            .UseDevExpressEditors()
            .UseDevExpressScheduler()
                .UseBarcodeReader()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                })
                ;
             


#if DEBUG
            builder.Logging.AddDebug();
#endif// Register your services here
           
            return builder.Build();
        }
    }
}
