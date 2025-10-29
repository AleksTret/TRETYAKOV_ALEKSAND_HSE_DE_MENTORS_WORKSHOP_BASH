#!/bin/bash

echo "=== МОНИТОРИНГ СИСТЕМЫ ==="

echo "CPU: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"

mem_total=$(free -m | awk 'NR==2{print $2}')
mem_used=$(free -m | awk 'NR==2{print $3}')
mem_percent=$((mem_used * 100 / mem_total))
echo "Память: ${mem_used}MB/${mem_total}MB (${mem_percent}%)"

echo "Диск: $(df -h / | awk 'NR==2{print $5 " (" $3 "/" $2 ")"}')"

# Проверка памяти > 80%
[ $mem_percent -gt 80 ] && echo "ВНИМАНИЕ: Память > 80%" && ps aux --sort=-%mem | head -6
# [ $mem_percent -gt 50 ] && echo "ВНИМАНИЕ: Память > 50%" && ps aux --sort=-%mem | head -6