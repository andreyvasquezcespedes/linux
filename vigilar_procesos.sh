#!/bin/bash

while true; do
    ps -eo pid,comm,%cpu --sort=-%cpu |
    grep '^ *[0-9].*cpu_stress.sh' |
    while read -r pid comm cpu; do

        if awk "BEGIN {exit !($cpu > 20)}"; then
            echo "[WARNING] Proceso $comm (PID: $pid) consumiendo $cpu% CPU"

            if awk "BEGIN {exit !($cpu > 50)}"; then
                echo "[INFO] Matando proceso $comm (PID: $pid)"
                kill -9 "$pid"
            fi
        fi

    done

    sleep 5
done
