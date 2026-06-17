#!/bin/bash

# Tiempo límite: 20 minutos
TIME_LIMIT=$((60 * 20))
START_TIME=$(date +%s)

# Nombres falsos
NAMES=("phantom" "update" "backup" "runner" "sync-agent" "daemonX")

consume_cpu() {
  end=$((SECONDS + $1))
  while [ $SECONDS -lt $end ]; do
    echo $((RANDOM * RANDOM)) > /dev/null
  done
}

while true; do
  CURRENT_TIME=$(date +%s)
  ELAPSED=$((CURRENT_TIME - START_TIME))
  if [ "$ELAPSED" -ge "$TIME_LIMIT" ]; then
    echo "👻 Proceso fantasma se autodestruye tras 20 minutos..."
    exit 0
  fi

  name=${NAMES[$RANDOM % ${#NAMES[@]}]}

  exec -a "$name" bash -c '
    duration=$((10 + RANDOM % 20))
    if (( RANDOM % 2 == 0 )); then
      echo "👻 $0 aparece y consume CPU por $duration segundos..."
      end=$((SECONDS + duration))
      while [ $SECONDS -lt $end ]; do
        echo $((RANDOM * RANDOM)) > /dev/null
      done
    else
      echo "👻 $0 aparece sigilosamente sin consumir CPU..."
      sleep $duration
    fi
  '

  sleep $((10 + RANDOM % 20))
done
