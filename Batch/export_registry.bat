@echo off
@break off
@title Regexport
@color 0a

echo Creating tmp directory
if not exist "%TEMP%\regexport" mkdir %TEMP%\regexport

echo Changing directory
cd %TEMP%\regexport

echo Exporting HKLM...
reg EXPORT HKLM hklm.reg /y

echo Exporting HKCU...
reg EXPORT HKCU hkcu.reg /y

echo Exporting HKCR...
reg EXPORT HKCR hkcr.reg /y

echo Exporting HKU...
reg EXPORT HKU hku.reg /y

echo Exporting HKCC...
reg EXPORT HKCC hkcc.reg /y

echo Opening folder...
explorer %TEMP%\regexport