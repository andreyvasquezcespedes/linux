#!/bin/bash

echo "Introduce el nombre del archivo:"
read file_name

if [ ! -f "$file_name" ]; then
    touch "$file_name"
    echo "Se creó el archivo $file_name."
    new_line="!Pura vida!"
else
    new_line="$(date '+%d-%m-%Y %H:%M:%S')"
fi

echo "$new_line" >> "$file_name"
echo "Se agregó la línea: $new_line"
