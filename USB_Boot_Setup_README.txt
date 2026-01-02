====================================================
        USB TOOLKIT SETUP — QUICK START GUIDE
====================================================

This USB contains a setup script that prepares a
Ventoy-based recovery toolkit.

----------------------------------------------------
⚠️ BEFORE YOU BEGIN — READ THIS FIRST ⚠️
----------------------------------------------------

• This USB WILL be modified.
• Running this on the wrong drive WILL erase data.
• YOU are responsible for selecting the correct drive.
• This setup is SAFE when used correctly.

⚠️ DO NOT RUN THIS ON YOUR MAIN DRIVE (C:) ⚠️

Recommended:
• 64GB minimum (128GB+ strongly recommended)
• USB 3.0 or higher (Samsung BAR Plus is ideal)
• Ventoy MUST be installed first

----------------------------------------------------
WHAT THIS SCRIPT DOES
----------------------------------------------------
✔ Creates a clean, organized folder structure  
✔ Adds trusted download shortcuts  
✔ Prepares the drive for ISO-based booting  
✔ Does NOT install any software  
✔ Does NOT modify your OS  

----------------------------------------------------
MINIMAL / SAFE SETUP (RECOMMENDED)
----------------------------------------------------
If you only want the essentials, this is all you need:

USB_ROOT/
│
├── ISO/
│   ├── Windows/
│   │   └── Windows_10_or_11.iso
│   │
│   ├── Tools/
│   │   ├── GParted.iso
│   │   └── Rescuezilla.iso
│
└── MediCat.USB/   (optional but HIGHLY recommended)

----------------------------------------------------
HOW TO FIND THE CORRECT USB DRIVE LETTER
----------------------------------------------------
⚠️ DO THIS CAREFULLY — THIS IS THE MOST IMPORTANT STEP ⚠️

1. Plug in your USB drive.
2. Open **File Explorer**
3. Click **This PC**
4. Find your USB under "Devices and drives"
5. Note the drive letter (example: E:)

❌ DO NOT USE C:    (CAN NOT STRESS THIS ENOUGH)/
❌ DO NOT GUESS
✅ DOUBLE CHECK BEFORE CONTINUING

----------------------------------------------------
HOW TO RUN THE SCRIPT
----------------------------------------------------

1) Open **PowerShell as Administrator**
   - Start Menu → type "PowerShell"
   - Right-click → Run as administrator

2) Allow scripts for this session only:

   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

   (This does NOT permanently change system security.)

3) Switch to your USB drive:
   
   E:

4) Run the setup script:

   .\Setup_USB_Toolkit.ps1

----------------------------------------------------
WHAT HAPPENS NEXT
----------------------------------------------------
✔ Folder structure is created  
✔ Download links are added  
✔ No software is installed  
✔ Safe to run multiple times  

----------------------------------------------------
FINAL FOLDER STRUCTURE
----------------------------------------------------

USB_ROOT/
├── ISO/
│   ├── Linux/
│   │   ├── Ubuntu
│   │   ├── Linux Mint
│   │   ├── Kali
│   │   └── SystemRescue
│   ├── Tools/
│   │   ├── Clonezilla
│   │   ├── GParted
│   │   ├── Rescuezilla
│   │   └── MemTest86
│   └── Windows/
│       ├── Windows 10
│       └── Windows 11
│
├── Drivers/
│   ├── Chipset
│   ├── LAN
│   ├── WiFi
│   ├── Storage
│   └── Touchpad
│
├── MediCat.USB
└── README.txt

----------------------------------------------------
FINAL NOTES
----------------------------------------------------
• This USB is meant for recovery, diagnostics, and repair  
• Keep a backup copy once finished  
• Update ISOs occasionally  
• Do NOT store personal files on this drive  

----------------------------------------------------
YOU'RE DONE.
----------------------------------------------------
This USB is now a professional-grade recovery toolkit.
Use it. Clone it. Keep it safe.
