@echo off
echo Opening assets/images folder...
echo.
echo INSTRUCTIONS:
echo 1. Paste your profile photo here
echo 2. Rename it to: profile.jpg
echo 3. Restart the Flutter app
echo.
echo Press any key to open folder...
pause > nul

explorer "%~dp0assets\images"

echo.
echo Folder opened! 
echo Save your image as: profile.jpg
echo Then run: flutter run -d chrome
echo.
pause
