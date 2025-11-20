#!/usr/bin/env bash
#!/usr/bin/env

# Basic update
#sudo apt update -y && sudo apt upgrade -y && sudo flatpak update -y

# Enable multiple architectures
sudo dpkg --add-architecture i386
sudo apt update -y && sudo apt upgrade -y

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

# TeamViewer
wget -O teamviewer_amd64.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb -y

# Blender
sudo flatpak install flathub org.blender.Blender -y

# InkScape
sudo flatpak install flathub org.inkscape.Inkscape -y

# GIMP
sudo flatpak install flathub org.gimp.GIMP -y

# WireShark
sudo apt install wireshark -y

# Nord VPN
sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh) -p nordvpn-gui -y

# Zoom
sudo flatpak install flathub us.zoom.Zoom -y

# Bottles
sudo flatpak install flathub com.usebottles.bottles -y

##########
# Gaming
##########

# Gaming Essentials
sudo apt install -y dbus vulkan-tools mangohud goverlay gamescope gamemode vkbasalt

# Wine
sudo apt install wine winetricks -y

# DosBox
sudo apt install dosbox -y

# Steam
sudo apt install steam-installer -y

# Heroic Games Launcher
#sudo apt install -y https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.16.1/Heroic-2.16.1-linux-x86_64.rpm
sudo flatpak install flathub com.heroicgameslauncher.hgl -y

# Lutris
sudo apt install lutris -y
#sudo flatpak install flathub net.lutris.Lutris -y

##########
# Programing
##########

# Build Essentials
sudo apt install build-essential -y
sudo apt install -y patch openssl openssh-server samba checkpolicy policycoreutils podman

# Git
sudo apt install git git-core -y

# GitHub Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y github-desktop

##########
# Programing Languages
##########

# Perl
sudo apt install perl -y

# Rust
sudo apt install rustc cargo rustfmt -y
sudo apt install rustup -y

# C/C++
sudo apt install gcc tcc cpp chibicc pcc g++ clang autoconf automake cmake -y

# GTK+
sudo apt install devhelp -y

# Python
sudo apt install python3 -y

# .Net
wget https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update -y && sudo apt upgrade -y
sudo apt install dotnet-sdk-10.0 -y

# Java
sudo apt install default-jdk maven ant -y
wget -O jdk-25_linux-x64_bin.deb https://download.oracle.com/java/25/latest/jdk-25_linux-x64_bin.deb
sudo apt install ./jdk-25_linux-x64_bin.deb -y

# PHP
sudo apt install php phpunit php-cli php-common php-fpm php-ctype php-json php-mbstring php-gd php-curl php-mysqli php-xml php-gmp php-xmlrpc php-bcmath php-soap php-ldap php-mysqlnd -y

# Deno
sudo curl -fsSL https://deno.land/install.sh | sh

# Ruby
sudo apt install ruby -y

# Node JS
sudo apt install nodejs -y

# Yarn
sudo apt install yarnpkg -y

# Go
sudo apt install golang golang-go gccgo -y
mkdir -p $HOME/go
mkdir -p $HOME/go/src
mkdir -p $HOME/go/bin

##########
# IDEs
##########

# Mono Develop
sudo apt install mono-devel -y

# Visual Studio Code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm -f microsoft.gpg
sudo touch /etc/apt/sources.list.d/vscode.sources
sudo chmod o+w /etc/apt/sources.list.d/vscode.sources
sudo echo "Types: deb" >> /etc/apt/sources.list.d/vscode.sources
sudo echo "URIs: https://packages.microsoft.com/repos/code" >> /etc/apt/sources.list.d/vscode.sources
sudo echo "Suites: stable" >> /etc/apt/sources.list.d/vscode.sources
sudo echo "Components: main" >> /etc/apt/sources.list.d/vscode.sources
sudo echo "Architectures: amd64,arm64,armhf" >> /etc/apt/sources.list.d/vscode.sources
sudo echo "Signed-By: /usr/share/keyrings/microsoft.gpg" >> /etc/apt/sources.list.d/vscode.sources
sudo chmod o-w /etc/apt/sources.list.d/vscode.sources
sudo apt install apt-transport-https -y
sudo apt update -y && sudo apt upgrade -y
sudo apt install code -y

# Code Blocks
sudo apt install codeblocks -y

# JetBrains Toolbox
sudo curl -fSL $(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" | jq -r ".TBA[0].downloads.linux.link") -o "jetbrains-toolbox.tar.gz"
if [ -d "/opt/jetbrains-toolbox" ]; then
    sudo rm -rf "/opt/jetbrains-toolbox"
fi
sudo mkdir -p "/opt/jetbrains-toolbox"
sudo tar -xzf "jetbrains-toolbox.tar.gz" -C "/opt/jetbrains-toolbox" --strip-components=1
sudo ln -sf "/opt/jetbrains-toolbox/jetbrains-toolbox" "/usr/bin/jetbrains-toolbox"

# Netbeans
wget -O apache-netbeans_28-1_amd64.deb https://github.com/codelerity/netbeans-packages/releases/download/v28-build1/apache-netbeans_28-1_amd64.deb
sudo apt install ./apache-netbeans_28-1_amd64.deb -y

# Eclipse
wget https://mirror.umd.edu/eclipse/oomph/epp/2025-03/R/eclipse-inst-jre-linux64.tar.gz
if [ -d "/opt/eclipse-installer" ]; then
    sudo rm -rf "/opt/eclipse-installer"
fi
sudo mkdir -p "/opt/eclipse-installer"
sudo tar -xzf "eclipse-inst-jre-linux64.tar.gz" -C "/opt/eclipse-installer" --strip-components=1
/opt/eclipse-installer/eclipse-inst

##########
# Databases
##########
