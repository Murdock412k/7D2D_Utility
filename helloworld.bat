@echo off
title Dev's 7d2dLauncher
cls

:MENU
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
echo Removing mods...

rem Loop through each file in the directory and delete
for %%f in ("C:\Users\Devon\AppData\Roaming\7DaysToDie\Mods\*.*") do (
    if exist "%%f" (
        echo Deleting: %%~nxf
        del /Q "%%f" >nul 2>&1
    )
)

echo.
echo All mods removed.
pause
goto MENU
