using System.Text.Json;
using System.IO;
using Microsoft.Maui.Storage;

namespace CodeABarre.Helpers
{
    public static class ConfigHelper
    {
        public static string GetConnectionString(string name = "DefaultConnection")
        {
            var file = Path.Combine(FileSystem.Current.AppDataDirectory, "appsettings.json");
            
            // Si le fichier n'existe pas dans AppDataDirectory, le copier depuis les ressources
            if (!File.Exists(file))
            {
                var assembly = typeof(ConfigHelper).Assembly;
                using var stream = assembly.GetManifestResourceStream("CodeABarre.appsettings.json");
                if (stream == null)
                    throw new FileNotFoundException("Fichier de configuration introuvable dans les ressources");

                using var reader = new StreamReader(stream);
                var content = reader.ReadToEnd();
                File.WriteAllText(file, content);
            }

            var json = File.ReadAllText(file);
            using var doc = JsonDocument.Parse(json);
            var root = doc.RootElement;
            return root.GetProperty("ConnectionStrings").GetProperty(name).GetString();
        }
    }
} 