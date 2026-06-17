#!/bin/bash
while true; do
  echo "Hola desde systemd" >> /var/log/saludador.log
  sleep 10
done
