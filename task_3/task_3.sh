#!/bin/bash

read -p "Введите число: " num

if [ -z "$num" ] || ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Ошибка: введите целое число"
    exit 1
fi

if [ "$num" -gt 0 ]; then
    echo "Положительное"
    
    i=1
    while [ "$i" -le "$num" ]; do
        echo "$i"
        i=$((i + 1))
    done
    
elif [ "$num" -lt 0 ]; then
    echo "Отрицательное"
else
    echo "Ноль"
fi