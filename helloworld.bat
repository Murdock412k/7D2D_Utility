@echo off
title Dev's 7d2dLauncher
cls

rem Set the path to the Mods folder
set "MODS_FOLDER=%APPDATA%\7DaysToDie\Mods"

rem Set the path to the Maps folder
set "MAPS_FOLDER=%APPDATA%\Devs7d2dLauncher\maps"

rem Define PowerShell command for delay (250 milliseconds)
set "delayCommand=powershell -Command "Start-Sleep -Milliseconds 250""

:MENU
color 0F
echo ------------------------------
echo     Dev's 7d2dLauncher
echo ------------------------------
echo.
echo (1) Launch Game
echo (2) Update Mods
echo (3) Download Map
echo (4) Remove Mods
echo.
set /p choice=Input your choice (1-4) then press Enter: 

rem Check user input and take appropriate action
if "%choice%"=="1" goto LaunchGame
if "%choice%"=="2" goto UpdateMods
if "%choice%"=="3" goto DownloadMap
if "%choice%"=="4" goto RemoveMods

echo Invalid choice. Please try again.
pause
goto MENU

:LaunchGame
echo Launching the game...
start steam://rungameid/251570
rem Add your commands to launch the game here
pause
goto MENU

:UpdateMods
cls
color 0A
echo Updating mods...

rem Set where you want to save the downloaded mod file
set "modFilePath=%AppData%\Devs7d2dLauncher\mods\Mods.zip"

rem Direct link to your mod file on GitHub (replace with your actual direct download link)
set "modFileUrl=https://github.com/Murdock412k/7D2D_Utility/releases/download/Mods/Mods.zip"

rem Use PowerShell to download the file
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%modFileUrl%', '%modFilePath%')"

rem Check if the download was successful
if %errorlevel% neq 0 (
    echo Error: Failed to download mods.
    pause
    goto MENU
)

echo Mods downloaded successfully.

rem Extract the Mods.zip file to %APPDATA%\7DaysToDie\Mods
set "targetDir=%APPDATA%\7DaysToDie\Mods"
set "zipFile=%AppData%\Devs7d2dLauncher\mods\Mods.zip"

echo Extracting Mods.zip to %targetDir%...
powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%targetDir%'"

rem Check if extraction was successful
if %errorlevel% neq 0 (
    echo Error: Failed to extract mods.
    pause
    goto MENU
)

echo Mods updated and extracted successfully... Returning to menu...
ping -n 6 127.0.0.1 >nul
cls
goto MENU

:DownloadMap
cls
color 0B
echo Downloading map...

rem Set where you want to save the downloaded map file
set "mapFilePath=%AppData%\Devs7d2dLauncher\maps\DeadwoodCounty.zip"

rem Direct link to your map file on GitHub (replace with your actual direct download link)
set "mapFileUrl=https://github.com/Murdock412k/7D2D_Utility/releases/download/Map/DeadwoodCounty.zip"

rem Use PowerShell to download the file
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%mapFileUrl%', '%mapFilePath%')"

rem Check if the download was successful
if %errorlevel% neq 0 (
    echo Error: Failed to download map.
    pause
    goto MENU
)

echo Map downloaded successfully.

rem Extract the DeadwoodCounty.zip file to %APPDATA%\7DaysToDie\GeneratedWorlds
set "targetDir=%APPDATA%\7DaysToDie\GeneratedWorlds"
set "zipFile=%AppData%\Devs7d2dLauncher\maps\DeadwoodCounty.zip"

echo Extracting DeadwoodCounty.zip to %targetDir%...
powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%targetDir%'"

rem Check if extraction was successful
if %errorlevel% neq 0 (
    echo Error: Failed to extract map.
    pause
    goto MENU
)

echo Map downloaded and extracted successfully... Returning to menu...
ping -n 6 127.0.0.1 >nul
cls
goto MENU

:RemoveMods
cls
echo Removing mods...

rem Set target directory for mods removal
set "targetDir=%APPDATA%\7DaysToDie"

rem Check if Mods folder exists
if not exist "%targetDir%\Mods" (
    echo Mods folder not found.
    pause
    goto MENU
)
color 0C
echo Deleting contents of Mods folder...

rem Loop through each file and directory in Mods folder
for /D %%d in ("%MODS_FOLDER%\*") do (
    echo Deleting mod: %%~nxd
    rmdir /s /q "%%d"
)
for %%f in ("%MODS_FOLDER%\*") do (
    echo Deleting mod: %%~nxf
    del /q "%%f"
)

echo.
echo Removed all mods... returning to menu...

rem Pause for 5 seconds
ping -n 6 127.0.0.1 >nul

rem Clear screen and return to menu
cls
goto MENU
