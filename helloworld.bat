@echo off
title Dev's 7d2dLauncher
cls

rem Set the path to the Mods folder
set "MODS_FOLDER=%APPDATA%\7DaysToDie\Mods"

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
echo Updating mods...
rem Add your commands to update mods here
pause
goto MENU

:DownloadMap
echo Downloading map...
rem Add your commands to download map here
pause
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
%delayCommand% >nul 2>&1

rem Pause for 5 seconds
ping -n 6 127.0.0.1 >nul

rem Clear screen and return to menu
cls
goto MENU
