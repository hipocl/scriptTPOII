@echo off
title Zipwn
color A
if not exist "C:\Program Files\7-Zip" (
	echo 7-Zip not installed!
	pause
	exit
)

echo.
set /p archive="Ingrese Archivo: "
if not exist "%archive%" (
	echo Archivo no encontrado!
	pause
	exit
)

set /p wordlist="Ingrese Lista: "
if not exist "%wordlist%" (
	echo Lista no encontrada!
	pause
	exit
)
echo Cargando...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
echo no esta en la lista
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo INTENTO : %pass%
if /I %errorlevel% EQU 0 (
	echo Exito! Clave: %pass%
	pause
	exit
)