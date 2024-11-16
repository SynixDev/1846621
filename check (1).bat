@echo off
title SLS-Services-Checker-Spoofer

:start
cls


:: Disques durs
echo [91m       Disk Drives
echo [90m============================================================[97m
wmic diskdrive get model, serialnumber, size, status, manufacturer, interfaceType, mediatype, deviceid

:: Carte mère
echo [93m       Motherboard
echo [90m============================================================[97m
wmic baseboard get serialnumber, product, manufacturer, version

:: SMBios UUID
echo [92m        SMBios
echo [90m============================================================[97m
wmic path win32_computersystemproduct get uuid

:: BIOS
echo [95m         BIOS
echo [90m============================================================[97m
wmic bios get serialnumber, version, manufacturer, smbiosbiosversion, releaseDate

:: CPU
echo [91m         CPU
echo [90m============================================================[97m
wmic cpu get processorid, name, numberofcores, numberoflogicalprocessors, maxclockspeed, l2cachesize, l3cachesize, architecture

:: RAM
echo [94m         RAM
echo [90m============================================================[97m
wmic memorychip get serialnumber, manufacturer, capacity, speed, partnumber, devicelocator, configuredclockSpeed

:: GPU
echo [96m         GPU
echo [90m============================================================[97m
wmic PATH Win32_VideoController GET Description, Name, PNPDeviceID, DriverVersion, Status, AdapterRAM, AdapterDACType, VideoProcessor, CurrentRefreshRate

:: Périphériques USB
echo [93m       USB Devices
echo [90m============================================================[97m
wmic path CIM_LogicalDevice where "Description like 'USB%'" get Description, DeviceID, Manufacturer, Status

:: Adaptateurs réseau (sans IP)
echo [92m        Network Adapters (No IP)
echo [90m============================================================[97m
wmic nic where "MACAddress is not null" get Name, MACAddress, Manufacturer, NetEnabled, ProductName

:: Disques logiques
echo [96m         Logical Disks
echo [90m============================================================[97m
wmic logicaldisk get DeviceID, VolumeSerialNumber, FileSystem, Size, FreeSpace, DriveType

:: Lecteurs optiques (CD/DVD)
echo [91m         Optical Drives
echo [90m============================================================[97m
wmic cdrom get Name, Drive, Manufacturer, MediaLoaded, Status, VolumeName

:: Systèmes d'exploitation
echo [94m         Operating System (Serial Number Only)
echo [90m============================================================[97m
wmic os get SerialNumber

:: Moniteurs
echo [95m         Monitors
echo [90m============================================================[97m
wmic desktopmonitor get Name, DeviceID, MonitorType, PixelsPerXLogicalInch, PixelsPerYLogicalInch

:: Batteries (si applicable)
echo [93m       Battery Information
echo [90m============================================================[97m
wmic path Win32_Battery get Name, BatteryStatus, EstimatedChargeRemaining, EstimatedRunTime, DesignCapacity, DesignVoltage

:: Claviers
echo [92m        Keyboards
echo [90m============================================================[97m
wmic path Win32_Keyboard get Description, DeviceID

:: Souris
echo [96m         Pointing Devices (Mouse)
echo [90m============================================================[97m
wmic path Win32_PointingDevice get Description, DeviceID, Manufacturer, Status

:: Ports série
echo [94m         Serial Ports
echo [90m============================================================[97m
wmic path Win32_SerialPort get Name, Description, DeviceID, ProviderType

:: Imprimantes
echo [95m         Printers (Serial Numbers)
echo [90m============================================================[97m
wmic printer get Name, PortName, Status, DeviceID

:: Écran tactile (si applicable)
echo [91m         Touch Screens
echo [90m============================================================[97m
wmic path Win32_PointingDevice where "Description like '%Touch%'" get Description, DeviceID, Manufacturer

:: Audio
echo [93m       Audio Devices
echo [90m============================================================[97m
wmic sounddev get Name, Manufacturer, Status

echo.
echo ============================================================
echo Press any key to refresh or close the window to exit.
pause>nul
goto start
