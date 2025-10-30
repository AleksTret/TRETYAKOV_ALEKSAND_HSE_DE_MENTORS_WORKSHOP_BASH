#!/bin/bash

dir="${1:-.}"
log="/var/log/file_sorter.log"
mkdir -p "$dir/Images" "$dir/Documents"

echo "Начало: $(date)" >> "$log"

for ext in jpg png gif; do
    for f in "$dir"/*.$ext; do
        [ -f "$f" ] && mv "$f" "$dir/Images/" && echo "Moved: $(basename "$f") to Images" >> "$log"
    done
done

for ext in txt pdf docx; do
    for f in "$dir"/*.$ext; do
        [ -f "$f" ] && mv "$f" "$dir/Documents/" && echo "Moved: $(basename "$f") to Documents" >> "$log"
    done
done

echo "Конец: $(date)" >> "$log"