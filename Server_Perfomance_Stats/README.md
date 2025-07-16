# server-stats.sh

Script Bash para analizar estadísticas básicas de rendimiento de un servidor Linux.

## Funcionalidades

- **Uso total de CPU:** Muestra el porcentaje de uso actual de la CPU.
- **Uso total de memoria:** Indica la memoria total, usada, libre y el porcentaje de uso.
- **Uso total de disco:** Muestra el espacio total, usado, libre y el porcentaje de uso del disco.
- **Top 5 procesos por uso de CPU:** Lista los 5 procesos que más CPU consumen en el momento.
- **Top 5 procesos por uso de memoria:** Lista los 5 procesos que más memoria consumen en el momento.
- **Versión del sistema operativo:** Muestra la versión del sistema operativo instalado.
- **Uptime:** Indica el tiempo que el sistema lleva encendido.
- **Load average:** Muestra la carga promedio del sistema.
- **Usuarios conectados:** Indica el número de usuarios únicos conectados actualmente.
- **Intentos fallidos de login:** Muestra los últimos 10 intentos fallidos de inicio de sesión (si los logs están disponibles y tienes permisos).

## Requisitos

- Bash
- Comandos estándar de Linux: `top`, `free`, `df`, `ps`, `lsb_release` o `/etc/os-release`, `uptime`, `who`, `awk`, `sort`, `uniq`, `grep`, `tac`.
- Permisos de lectura sobre los archivos de log (`/var/log/auth.log` o `/var/log/secure`) para ver los intentos fallidos de login. Puede requerir ejecutar el script con `sudo`.

## Uso

1. Da permisos de ejecución al script:
   ```bash
   chmod +x server-stats.sh
   ```
2. Ejecútalo:
   ```bash
   ./server-stats.sh
   ```
   Si necesitas ver los intentos fallidos de login y no tienes permisos, ejecútalo con sudo:
   ```bash
   sudo ./server-stats.sh
   ```

## Notas
- El script está diseñado para funcionar en la mayoría de distribuciones Linux.
- Si algún dato no aparece, puede deberse a diferencias entre distribuciones o falta de permisos.
- Puedes modificar el script para adaptarlo a tus necesidades. 

Project URL: https://roadmap.sh/projects/server-stats