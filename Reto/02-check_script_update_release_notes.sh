chmod +x update_release_notes.sh
su devopslead

#en otra terminal
ps aux | grep update_release_notes.sh

#Copiar el PID
htop -p 58044

ps -o pid,ni,comm -p 58044

sudo renice 10 -p 58044

ps -o pid,ni,comm -p 58044