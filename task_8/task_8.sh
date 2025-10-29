#!/bin/bash

[ $# -eq 0 ] && echo "Использование: $0 /путь/к/директории" && exit 1
[ ! -d "$1" ] && echo "Ошибка: директория не существует" && exit 1

log="backup_$(date +%Y-%m-%d).log"
count=0

echo "Начало: $(date)" > "$log"
for file in "$1"/*; do
    [ -f "$file" ] && cp "$file" "${file%.*}_$(date +%Y-%m-%d).${file##*.}" && echo "$(basename "$file")" >> "$log" && ((count++))
done
echo "Файлов: $count" >> "$log"

echo "Создано копий: $count (лог: $log)"