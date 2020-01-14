@echo off
if "%~1"=="" goto :current
if "%~1"=="." goto :current
goto :param

:current
sudo powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "%CD%"

goto :ende

:param
sudo powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "%1"

:ende
