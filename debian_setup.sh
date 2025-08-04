#!/usr/bin/env bash
#!/usr/bin/env

# Basic update
#sudo apt update -y && sudo apt upgrade -y && sudo flatpak update -y

# Enable non-free software
sudo apt install software-properties-common -y
sudo apt-add-repository contrib non-free non-free-firmware

# Flatpak
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Snap
#sudo apt install snapd -y
#sudo ln -s /var/lib/snapd/snap /snap
#sudo snap install snap-store -y

# Curl
sudo apt install curl -y

# WGet
sudo apt install wget -y

# nVidia
#sudo apt install linux-headers-amd64
#install_items+=" /etc/modprobe.d/nvidia-blacklists-nouveau.conf /etc/modprobe.d/nvidia.conf /etc/modprobe.d/nvidia-options.conf "
#apt install nvidia-open-kernel-dkms nvidia-driver firmware-misc-nonfree
#cat /sys/module/nvidia_drm/parameters/modeset
#echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-options.conf
#echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1" >> /etc/modprobe.d/nvidia-options.conf
#Secure boot
#sudo dkms generate_mok
#sudo mokutil --import /var/lib/dkms/mok.pub # prompts for one-time password
#sudo mokutil --list-new # recheck your key will be prompted on next boot
#rebooting machine then enters MOK manager EFI utility: enroll MOK, continue, confirm, enter password, reboot
#sudo dmesg | grep cert # verify your key is loaded
#sudo dpkg-reconfigure nvidia-kernel-dkms

# Codecs

# Virtualization

# Theme

# Archiving
sudo apt install ark unrar zip unzip tar xz-utils gzip bzip2 minizip lzma lhasa arj unace dpkg -y

# Printers
sudo apt install cups printer-driver-escpr hplip -y

# TLP
#sudo apt install tlp tlp-rdw -y
#sudo systemctl enable tlp.service
#sudo systemctl start tlp.service
#sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
# ThinkPads only:
#sudo apt install tp-smapi-dkms -y

# Tuned
sudo apt install tuned -y
sudo systemctl start tuned
sudo systemctl enable tuned

# Firewall
sudo apt install -y ufw
sudo ufw disable
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Timeshift
sudo apt install timeshift -y

# PDF viewer
