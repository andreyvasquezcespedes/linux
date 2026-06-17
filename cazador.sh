#!/bin/bash

LOG="phantom_report.txt"
echo "🔍 Iniciando cazador de procesos fantasma..." > $LOG

# Lista de nombres sospechosos
NOMBRES="phantom|update|backup|runner|sync-agent|daemonX"

while true; do
  echo "⏱️ Revisión: $(date)" >> $LOG

  ps -eo pid,args,%cpu --sort=-%cpu | grep -E "$NOMBRES" | awk '$NF > 10.0 {print $1, $2, $3}' | while read PID NAME CPU; do
    echo "🚨 Detectado: $NAME (PID=$PID, CPU=${CPU}%)"

    if (( $(echo "$CPU > 30.0" | bc -l) )); then
      kill -9 $PID
      echo "☠️ $NAME (PID $PID) matado por alto uso de CPU." >> $LOG
    else
      echo "🔎 $NAME (PID $PID) solo observado." >> $LOG
    fi
  done

  sleep 10
done
