@echo off
setlocal EnableDelayedExpansion
chcp 1252

REM Ruta donde se almacenará el archivo de registro
set "log=\\jupiter\PUBLICA\EQUIPOS\%COMPUTERNAME%.txt"

REM Rutas de los programas a verificar
set "programa1=C:\Program Files\Tracker Software\PDF Editor\PDFXEdit.exe"
set "programa2=C:\ATMSOFTWARE\ATMCONTANETCLIENTE\ATMContaNet.exe"
set "programa3=C:\ATMSOFTWARE\ATMGTCLIENTE\ATMGT.exe"
set "programa4=C:\ATMSOFTWARE\ATMNOMINETCLIENTE\atmNomiNet.exe"

REM Obteniendo el nombre completo del usuario actual usando un comando NET USER
for /f "tokens=*" %%A in ('net user %USERNAME% /domain ^| find "Nombre completo"') do (
    set "ultimo_usuario=%%A"
)
set "ultimo_usuario=!ultimo_usuario:~36!"

REM Inicio de la creación del archivo de registro
echo *************************** > %log%
echo Nombre Equipo: %COMPUTERNAME: =% >> %log%
echo Ultimo Usuario: %ultimo_usuario% >> %log%

REM Obteniendo la lista de carpetas de usuarios
for /f "delims=" %%a in ('dir /b /ad "C:\Users\"') do set "carpetas=!carpetas!,%%a"
echo Usuarios Equipo: !carpetas:~1! >> %log%

echo Fecha: %DATE% >> %log%
echo . >> %log%
echo . >> %log%
echo . >> %log%

REM Agregando información de las interfaces de red
echo INTERFACES DE RED: >> %log%
ipconfig /all >> %log%

echo . >> %log%
echo . >> %log%
echo . >> %log%

REM Agregando información de las impresoras configuradas
echo IMPRESORAS CONFIGURADAS: >> %log%
REM Obtener y almacenar la lista de impresoras configuradas
powershell.exe -command "Get-WmiObject -Query 'SELECT * FROM Win32_Printer' | ForEach-Object { Write-Host ('Impresora: ' + $_.Name + ' IP: ' + $_.PortName) }" >> %log% 2>&1

echo . >> %log%
echo . >> %log%
echo . >> %log%

REM Agregando información de los programas instalados
echo PROGRAMAS INSTALADOS: >> %log%
REM Verificar si el archivo del programa está presente y agregarlo al registro
if exist "%programa1%" (
    echo PDF-XChange Editor>> %log%
)

if exist "%programa2%" (
    echo ATMContaNet>> %log%
)

if exist "%programa3%" (
    echo ATMGT>> %log%
)

if exist "%programa4%" (
    echo ATMNOMINET>> %log%
)
