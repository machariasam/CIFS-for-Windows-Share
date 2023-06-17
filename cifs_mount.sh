#!/bin/bash

# Install CIFS utilities on Debian and RPM based systems
sudo apt install cifs-utils -y
sudo yum install cifs-utils -y

# Set permissions and ownership as following
# The NAS storage will use this
sudo chown root: nas_share_logins
sudo chmod 600 nas_share_logins

# The Shared folder will use this
sudo chown root: windows_logins
sudo chmod 600 windows_logins

# Load the variables from the files
source nas_share_logins
source windows_logins

# Create a directory for mounting the share
sudo mkdir -p /mnt/"$share_name"

# Mount the share with directory and file permissions set to 0755
sudo mount.cifs //"$SERVER_IP"/"$share_name" /mnt/"$share_name" -o credentials=/etc/windows_server_logins,uid=1000,gid=1000,dir_mode=0755,file_mode=0755

# Make the mount persistent even after reboot
echo '//'$SERVER_IP'/'$share_name'  /mnt/'$share_name'  cifs  credentials=/etc/windows_server_logins,file_mode=0755,dir_mode=0755 0       0''' >> /etc/fstab

# Mount the share
sudo mount /mnt/"$share_name"

