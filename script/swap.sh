sudo dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo -n "/swapfile   swap    swap    sw  0   0" >> /etc/fstab
