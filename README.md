# Equipo Info Logger

Este repositorio contiene un script en Batch (`log_info.bat`) que recopila información sobre el equipo, incluyendo:
- Nombre del equipo y último usuario registrado.
- Lista de usuarios con carpetas en `C:\Users`.
- Interfaces de red y su configuración.
- Impresoras configuradas.
- Programas específicos instalados.

## Uso
1. **Descargar o clonar el repositorio:**
   ```sh
   git clone https://github.com/tu-usuario/equipo_info_logger.git
   cd equipo_info_logger
   ```

2. **Ejecutar el script:**
   - Haz doble clic en `log_info.bat` o ejecútalo desde la línea de comandos:
     ```sh
     log_info.bat
     ```

3. **Revisar el archivo de registro:**
   - El archivo de salida se genera en `\\jupiter\PUBLICA\EQUIPOS\%COMPUTERNAME%.txt`.

## Personalización
Puedes modificar las rutas de los programas a verificar dentro del script, editando estas líneas:
```bat
set "programa1=C:\Program Files\Tracker Software\PDF Editor\PDFXEdit.exe"
set "programa2=C:\ATMSOFTWARE\ATMCONTANETCLIENTE\ATMContaNet.exe"
set "programa3=C:\ATMSOFTWARE\ATMGTCLIENTE\ATMGT.exe"
set "programa4=C:\ATMSOFTWARE\ATMNOMINETCLIENTE\atmNomiNet.exe"
```

## Requisitos
- Windows con soporte para archivos `.bat`.
- Acceso a la red donde se almacena el archivo de salida (si aplica).
- Permisos para ejecutar comandos `net user`, `ipconfig` y `powershell`.

## Contribución
Si deseas mejorar este script, puedes hacer un fork del repositorio y enviar un pull request con tus cambios.

## Licencia
Este proyecto está bajo la licencia MIT. Puedes usarlo y modificarlo libremente.

