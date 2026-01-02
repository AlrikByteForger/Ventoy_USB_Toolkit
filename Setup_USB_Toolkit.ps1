# WARNING: This script DOES NOT download or install ISOs or apps. It ONLY creates folders and .url link shortcuts.
# WARNING: DOUBLE-CHECK the target drive letter. Running this on the wrong drive will create folders on that drive.

function Ensure-Folder { param([string]$Path) if (!(Test-Path -LiteralPath $Path)) { New-Item -ItemType Directory -Path $Path | Out-Null } }
function Write-UrlShortcut {
    param([string]$ShortcutPath,[string]$Url)
    $content = "[InternetShortcut]`r`nURL=$Url`r`n"
    Set-Content -LiteralPath $ShortcutPath -Value $content -Encoding ASCII
}

Write-Host ""
Write-Host "=== Ventoy USB Toolkit Layout Builder ===" -ForegroundColor Cyan
Write-Host "Creates folder layout + download link shortcuts (NO downloads)." -ForegroundColor Cyan
Write-Host ""

$driveLetter = Read-Host "Enter the TARGET USB drive letter (example: D)"
$driveLetter = $driveLetter.Trim().TrimEnd(":").ToUpper()
$root = "$driveLetter`:\"


if (!(Test-Path -LiteralPath $root)) {
    Write-Host "ERROR: Drive $root not found. Check the letter and try again." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "TARGET = $root" -ForegroundColor Yellow
$confirm = Read-Host "Type YES to continue"
if ($confirm -ne "YES") { Write-Host "Canceled." -ForegroundColor Yellow; exit 0 }

$paths = @(
    "$root\ISO",
    "$root\ISO\Linux",
    "$root\ISO\Tools",
    "$root\ISO\Windows",

    "$root\Drivers",
    "$root\Drivers\Chipset_Intel",
    "$root\Drivers\Intel_LAN",
    "$root\Drivers\Intel_WiFi",
    "$root\Drivers\Realtek_LAN",
    "$root\Drivers\Storage_NVMe",
    "$root\Drivers\Touchpad_ELAN",
    "$root\Drivers\Touchpad_Synaptics",

    "$root\Tools",
    "$root\Tools\Portable",
    "$root\Tools\Portable\Disk",
    "$root\Tools\Portable\Hardware",
    "$root\Tools\Portable\Remote",
    "$root\Tools\Portable\USB",

    "$root\MediCat.USB"
)

foreach ($p in $paths) { Ensure-Folder -Path $p }

$links = @(
    @{ Folder="$root"; Name="DOWNLOAD - Ventoy (Official).url"; Url="https://www.ventoy.net/en/download.html" },
    @{ Folder="$root"; Name="DOCS - Ventoy Getting Started.url"; Url="https://www.ventoy.net/en/doc_start.html" },

    @{ Folder="$root\ISO\Linux";  Name="DOWNLOAD - Ubuntu.url";        Url="https://ubuntu.com/download/desktop" },
    @{ Folder="$root\ISO\Linux";  Name="DOWNLOAD - Linux Mint.url";    Url="https://linuxmint.com/download.php" },
    @{ Folder="$root\ISO\Linux";  Name="DOWNLOAD - Kali.url";          Url="https://www.kali.org/get-kali/" },
    @{ Folder="$root\ISO\Linux";  Name="DOWNLOAD - SystemRescue.url";  Url="https://www.system-rescue.org/Download/" },

    @{ Folder="$root\ISO\Tools";  Name="DOWNLOAD - Clonezilla.url";    Url="https://clonezilla.org/downloads.php" },
    @{ Folder="$root\ISO\Tools";  Name="DOWNLOAD - GParted.url";       Url="https://gparted.org/download.php" },
    @{ Folder="$root\ISO\Tools";  Name="DOWNLOAD - Rescuezilla.url";   Url="https://rescuezilla.com/download" },
    @{ Folder="$root\ISO\Tools";  Name="DOWNLOAD - MemTest86+.url";    Url="https://www.memtest.org/" },
    @{ Folder="$root\ISO\Tools";  Name="DOWNLOAD - Hiren's BootCD PE.url"; Url="https://www.hirensbootcd.org/download/" },

    @{ Folder="$root\ISO\Windows"; Name="DOWNLOAD - Windows 11.url";   Url="https://www.microsoft.com/software-download/windows11" },
    @{ Folder="$root\ISO\Windows"; Name="DOWNLOAD - Windows 10.url";   Url="https://www.microsoft.com/software-download/windows10ISO" },
    @{ Folder="$root\ISO\Windows"; Name="INFO - WinPE (Sergei Strelec).url"; Url="https://sergeistrelec.name/" },

    @{ Folder="$root"; Name="DOWNLOAD - MediCat.url"; Url="https://medicatusb.com/" },

    @{ Folder="$root\Tools\Portable\Disk";     Name="DOWNLOAD - CrystalDiskInfo.url"; Url="https://crystalmark.info/en/software/crystaldiskinfo/" },
    @{ Folder="$root\Tools\Portable\Hardware"; Name="DOWNLOAD - HWiNFO.url";         Url="https://www.hwinfo.com/download/" },
    @{ Folder="$root\Tools\Portable\Hardware"; Name="DOWNLOAD - CPU-Z.url";          Url="https://www.cpuid.com/softwares/cpu-z.html" },
    @{ Folder="$root\Tools\Portable\USB";      Name="DOWNLOAD - Rufus.url";          Url="https://rufus.ie/" },
    @{ Folder="$root\Tools\Portable\Remote";   Name="DOWNLOAD - AnyDesk.url";        Url="https://anydesk.com/en/downloads/windows" }
)

foreach ($item in $links) {
    $shortcut = Join-Path $item.Folder $item.Name
    Write-UrlShortcut -ShortcutPath $shortcut -Url $item.Url
}

$readmePath = Join-Path $root "README.txt"
if (!(Test-Path -LiteralPath $readmePath)) {
    $owner = Read-Host "Optional: Enter your name for README.txt (or press Enter to skip)"
    if ($owner -and $owner.Trim().Length -gt 0) {
        $date = (Get-Date).ToString("yyyy-MM-dd")
        $readme = @"
=====================================================
          UNIVERSAL RECOVERY / TOOLKIT USB
=====================================================

Owner: $owner
Created: $date
Purpose: System repair, recovery, diagnostics, and OS installation
Status: Known-good / Verify after changes

VENTOY FIRST
-----------
1) Download + install Ventoy to this USB:
   https://www.ventoy.net/en/download.html

LAYOUT
------
$driveLetter`:\ISO\Linux     -> Linux ISOs (Ubuntu/Mint/Kali/SystemRescue)
$driveLetter`:\ISO\Tools     -> Tool ISOs (Clonezilla/GParted/Rescuezilla/MemTest/HBCD PE)
$driveLetter`:\ISO\Windows   -> Windows 10/11 ISOs + WinPE tools
$driveLetter`:\Drivers       -> Offline drivers (Chipset/LAN/WiFi/Touchpad/NVMe)
$driveLetter`:\Tools\Portable-> Portable Windows apps (Disk/Hardware/Remote/USB)
$driveLetter`:\MediCat.USB   -> MediCat folder toolkit (copied manually)

NOTES
-----
- This USB is meant to BOOT systems (BIOS/UEFI).
- The setup script ONLY creates folders + download link shortcuts.
- Download ISOs manually from official sources, then copy into the matching folders.
- Keep a backup clone of this USB before major updates.

=====================================================
"@
        Set-Content -LiteralPath $readmePath -Value $readme -Encoding UTF8
    }
}

Write-Host ""
Write-Host "✅ Done! ISO + Drivers + Tools\Portable + MediCat.USB created." -ForegroundColor Green
Write-Host "Shortcuts added. Now download ISOs/apps and place them into the matching folders." -ForegroundColor Green
Write-Host ""
