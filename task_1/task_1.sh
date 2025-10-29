#!/bin/bash

# Проверка аргумента
[ $# -eq 0 ] && echo "Не указан файл для проверки" && echo "Использование: $0 файл" 

[ $# -gt 0 ] && { 
    [ -e "$1" ] && echo "✓ $1 существует" || echo "✗ $1 отсутствует"
}
echo

get_type() {
    [ -f "$1" ] && echo "файл" && return
    [ -d "$1" ] && echo "каталог" && return
    [ -L "$1" ] && echo "ссылка" && return
    [ -b "$1" ] && echo "блочное устройство" && return
    [ -c "$1" ] && echo "символьное устройство" && return
    [ -p "$1" ] && echo "именованный канал" && return
    [ -S "$1" ] && echo "сокет" && return
    echo "неизвестный тип"
}

get_permissions() {
    stat -c "%A" "$1" 2>/dev/null || ls -ld "$1" | awk '{print $1}'
}

get_all_items() {
    for item in .[!.]* *; do
        # Пропускаем несуществующие 
        [ -e "$item" ] || continue
        # Пропускаем . и ..
        [ "$item" = "." ] || [ "$item" = ".." ] && continue
        echo "$item"
    done
}

# Вывод таблицы
for item in $(get_all_items); do
    echo -e "$item\t$(get_type "$item")\t$(get_permissions "$item")"
done | column -t -s $'\t'

