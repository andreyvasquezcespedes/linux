#!/bin/bash

file_name="/srv/releases/release_notes.txt"

while true; do
   if [ -f "$file_name" ]; then
    	echo "Se actualiza $(date)" >> "$file_name"
  fi
  sleep 10
done
