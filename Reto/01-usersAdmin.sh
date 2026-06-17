
sudo useradd -m -d /home/devopslead devopslead
sudo passwd devopslead

sudo useradd alice 
sudo passwd alice

sudo useradd bob
sudo passwd bob

sudo groupadd release_team

sudo usermod -aG release_team alice 
sudo usermod -aG release_team bob
sudo usermod -aG release_team devopslead

sudo useradd intruder
sudo passwd intruder

sudo mkdir /srv/releases

sudo chown devopslead:release_team /srv/releases

sudo chmod 750 /srv/releases

sudo touch /srv/releases/release_notes.txt
sudo sh -c 'echo "CR Pura vida!" >> /srv/releases/release_notes.txt'

sudo chown devopslead:release_team /srv/releases/release_notes.txt
sudo chmod 640 /srv/releases/release_notes.txt

sudo ls -l /srv/releases/release_notes.txt