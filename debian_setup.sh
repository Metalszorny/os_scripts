#!/usr/bin/env bash
#!/usr/bin/env

# Basic update
#sudo apt update -y && sudo apt upgrade -y && sudo flatpak update -y

# Enable non-free software
sudo apt install software-properties-common -y
sudo apt-add-repository main contrib non-free non-free-firmware

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
sudo apt install -y qemu-kvm qemu-system qemu-user-static qemu-utils qemu-system-x86 qemu-system-gui libvirt-daemon bridge-utils virtinst libvirt-daemon-system libvirt-clients virt-manager resolvconf
sudo systemctl status libvirtd
sudo systemctl restart networking

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
sudo flatpak install flathub com.adobe.Reader -y

# Chromium
sudo apt install chromium -y

# Firefox
sudo apt install firefox-esr -y

# Krusader
sudo apt install krusader krename kdiff3 kompare -y

# Thunderbird
sudo flatpak install flathub org.mozilla.Thunderbird -y

# k3b
sudo apt install k3b -y

# Brasero
sudo apt install brasero -y

# VLC
sudo flatpak install flathub org.videolan.VLC -y

# Tux Guitar
sudo flatpak install flathub ar.com.tuxguitar.TuxGuitar -y

# Clam Anti Virus
sudo apt install clamav clamav-daemon clamav-freshclam clamdscan clamtk -y
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl enable clamav-freshclam --now

# SciTE
sudo flatpak install flathub org.scintilla.SciTE -y

# Notepad++
#sudo flatpak install flathub com.notepadqq.Notepadqq -y

# Sublime Text 3
sudo flatpak install flathub com.sublimetext.three com.sublimemerge.App -y

# Libre Office
sudo flatpak install flathub org.libreoffice.LibreOffice -y

# Only Office
sudo flatpak install flathub org.onlyoffice.desktopeditors -y

# AnyDesk
sudo flatpak install flathub com.anydesk.Anydesk -y

# Balena Etcher
wget -q https://github.com/balena-io/etcher/releases/download/v2.1.4/balena-etcher_2.1.4_amd64.deb
sudo dpkg -i balena-etcher_*
sudo apt --fix-broken install -y
