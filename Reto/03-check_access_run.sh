chmod +x check_access.sh

#para correr el script se debe tomar en cuenta que para escribir en /var/log/access_attempts.log debe ser root

sudo ./check_access.sh

cat /var/log/access_attempts.log


#Pensaba crear un service, pero como dice un cron, encontre esta opcion
sudo nano /etc/cron.d/check_access

#dentro del archivo
*/2 * * * * root /home/n00177868/VSCodeProjects/DevOps/linux/Reto/check_access.sh intruder
#

sudo chown root:root /etc/cron.d/check_access
sudo chmod 644 /etc/cron.d/check_access



#para borrarlo
#sudo rm /etc/cron.d/check_access

