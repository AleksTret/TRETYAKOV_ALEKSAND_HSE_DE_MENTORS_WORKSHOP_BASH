#!/bin/bash

print_hello() {
    echo "Hello, $1"
}

add_numbers() {
    local sum=$(( $1 + $2 ))
    echo $sum 
}

echo "=== Демонстрация функций ==="

print_hello "World"
print_hello "Bash"
echo

echo "2 + 2 = $(add_numbers 2 2)"
echo "3 + 3 = $(add_numbers 3 3)"