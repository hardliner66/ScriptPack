@echo off
SETLOCAL
set TOEXECUTE="%~dpnx0"
net session >nul 2>&1
if %errorLevel% == 0 (
	rem Success: Administrative permissions confirmed.
	taskkill /IM explorer.exe /F
	CD /d %userprofile%\AppData\Local
	DEL IconCache.db /a
	explorer.exe
) else (
	rem Failure: Current permissions inadequate.
	powershell -Command "$file = (Get-ChildItem Env:TOEXECUTE).Value;$psi = new-object System.Diagnostics.ProcessStartInfo $file; $psi.Verb = 'runas'; $psi.WorkingDirectory = get-location; [System.Diagnostics.Process]::Start($psi);"
)
