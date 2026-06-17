#!/bin/bash

file_name="/srv/releases/release_notes.txt"
group_name="release_team"
log_file_name="/var/log/access_attempts.log"
group_root_name="root"

if ! id -nG | grep -qw "$group_root_name"; then
    echo "No tienen permisos de : $group_root_name"
    exit 0;
fi

if [ -z "$1" ]; then
    echo "Introduce el nombre del usuario:"
    read user_name
else
    user_name=$1
fi

if groups "$user_name" | grep -qw "$group_name"; then
    echo "Access granted"
    cat "$file_name"
else
    echo "Access denied"
    if [ ! -f "$log_file_name" ]; then
        touch "$log_file_name"
    fi
    new_line="Access denied to: $user_name - $(date '+%d-%m-%Y %H:%M:%S')"
    echo "$new_line" >> "$log_file_name"
fi

