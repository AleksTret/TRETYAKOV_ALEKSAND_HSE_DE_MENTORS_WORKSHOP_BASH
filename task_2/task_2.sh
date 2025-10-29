#!/bin/bash
echo "Текущий PATH:"
echo "$PATH" | tr ':' '\n'
echo

[ $# -eq 0 ] && echo "Использование: source $0 /путь/к/директории" && exit 1

new_dir="$1"
[ ! -d "$new_dir" ] && echo "Ошибка: '$new_dir' не существует" && exit 1

if echo ":$PATH:" | grep -q ":$new_dir:"; then
    echo "✗ Директория '$new_dir' уже в PATH"
else
    export PATH="$new_dir:$PATH"
    echo "✓ '$new_dir' добавлена в PATH"
fi

echo
echo "Обновленный PATH:"
echo "$PATH" | tr ':' '\n'