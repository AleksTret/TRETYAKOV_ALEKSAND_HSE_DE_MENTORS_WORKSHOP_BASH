#!/bin/bash

[ $# -eq 0 ] && echo "Использование: $0 /путь/к/директории" && exit 1
[ ! -d "$1" ] && echo "Ошибка: директория не существует" && exit 1

for file in "$1"/*; do
    [ -f "$file" ] && cp "$file" "${file%.*}_$(date +%Y-%m-%d).${file##*.}"
done

echo "Резервные копии созданы!"