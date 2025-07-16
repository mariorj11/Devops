#!/bin/bash

# Script para analizar estadísticas básicas de rendimiento del servidor

# 1. Uso total de CPU
cpu_usage=$(top -bn1 | grep "%Cpu" | awk '{print 100 - $8}')
echo "==============================="
echo "USO TOTAL DE CPU: $cpu_usage%"
echo "==============================="

# 2. Uso total de memoria
read total used free shared buff_cache available <<< $(free -m | awk 'NR==2{print $2, $3, $4, $5, $6, $7}')
mem_used_percent=$(( 100 * $used / $total ))
echo "MEMORIA TOTAL: $total MB"
echo "USADA: $used MB ($mem_used_percent%)"
echo "LIBRE: $free MB"
echo "==============================="

# 3. Uso total de disco
read disk_total disk_used disk_avail disk_pcent <<< $(df -h --total | grep total | awk '{print $2, $3, $4, $5}')
echo "DISCO TOTAL: $disk_total"
echo "USADO: $disk_used ($disk_pcent)"
echo "LIBRE: $disk_avail"
echo "==============================="

# 4. Top 5 procesos por uso de CPU
echo "TOP 5 PROCESOS POR USO DE CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo "==============================="
# 5. Top 5 procesos por uso de memoria
echo "TOP 5 PROCESOS POR USO DE MEMORIA:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo "==============================="
# 6. Información adicional (opcional)
echo "INFORMACIÓN ADICIONAL:"
echo "Versión del SO: $(lsb_release -d 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2)"
echo "Uptime: $(uptime -p)"
echo "Load average: $(uptime | awk -F'load average:' '{ print $2 }')"
echo "Usuarios conectados: $(who | awk '{print $1}' | sort | uniq | wc -l)"
echo "===============================" 