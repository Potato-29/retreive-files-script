@echo off
:: Set the source folder path
set sourcePath="D:\temp"

:: Search for the USB drive (assuming it's formatted as FAT32 or exFAT)
for /f "tokens=1,2 delims=:" %%d in ('wmic logicaldisk where "drivetype=2 and filesystem='FAT32' or filesystem='exFAT'" get deviceid^, volumename ^| find ":"') do (
    set destDrive=%%d:
    echo USB drive detected at %destDrive%
    
    :: Set the path to the .m4a audio file on the USB drive
    set audioFile=%destDrive%done.m4a

    :: Copy files from source to the detected pendrive
    echo Copying files from %sourcePath% to %destDrive%...
    xcopy /s /e /y %sourcePath% %destDrive%
    
    echo All files copied successfully!
    
    :: Play the .m4a audio file using the default media player
    start "" "%audioFile%"

    pause
    exit /b
)

echo No USB drive detected.
pause
