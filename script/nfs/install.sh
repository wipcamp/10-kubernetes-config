read -p "Share path: " NFS_SHARE_PATH
read -p "Share Network (x.x.x.x/xx): " NFS_SHARE_NETWORK

sudo apt-get update
sudo apt-get install nfs-kernel-server

sudo chown nobody:nogroup $NFS_SHARE_PATH
chmod 755 $NFS_SHARE_PATH
echo -n "$NFS_SHARE_PATH      $NFS_SHARE_NETWORK(rw,sync,no_root_squash,no_all_squash)" >> /etc/exports

firewall-cmd --permanent --add-service=nfs --zone=internal
sudo systemctl enable nfs-kernel-server
sudo systemctl restart nfs-kernel-server