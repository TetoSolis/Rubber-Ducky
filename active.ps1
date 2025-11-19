# URL de l'image
$url = "https://www.pokepedia.fr/images/3/30/LH006_-_Dracaufeu_de_Friede.png"

# Chemin local où l'image sera enregistrée
$path = "$env:TEMP\dracaufeu.png"

# Téléchargement de l'image
Invoke-WebRequest -Uri $url -OutFile $path

# Fonction permettant de changer le fond d'écran
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Appliquer le fond d’écran
[Wallpaper]::SystemParametersInfo(20, 0, $path, 3)

Write-Host "Fond d'écran Dracaufeu appliqué !" -ForegroundColor Green
