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
sudo apt install libavcodec-extra libdvdcss2 -y
sudo dpkg-reconfigure libdvd-pkg
echo "deb http://www.deb-multimedia.org buster main non-free" | sudo tee /etc/apt/sources.list.d/deb-multimedia.list
sudo apt update --allow-insecure-repositories
wget https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2024.9.1_all.deb
sudo dpkg -i deb-multimedia-keyring_2024.9.1_all.deb

# Virtualization
sudo apt install -y qemu-kvm qemu-system qemu-user-static qemu-utils qemu-system-x86 qemu-system-gui libvirt-daemon bridge-utils virtinst libvirt-daemon-system libvirt-clients virt-manager resolvconf
sudo systemctl status libvirtd
sudo systemctl restart networking

# Theme
#lookandfeeltool -a org.kde.breezedark.desktop
#sudo apt install -y qt6ct kvantum
#mkdir -p "$HOME/.config/qt6ct"
#cat <<EOF > "$HOME/.config/qt6ct/qt6ct.conf"
#[Appearance]
#style=kvantum
#color_scheme=default
#icon_theme=breeze
#EOF
#if ! grep -q "QT_QPA_PLATFORMTHEME=qt6ct" /etc/environment; then
#    echo "QT_QPA_PLATFORMTHEME=qt6ct" | sudo tee -a /etc/environment > /dev/null
#fi
#mkdir -p "$HOME/.config/Kvantum"
#cat <<EOF > "$HOME/.config/Kvantum/kvantum.kvconfig"
#[General]
#theme=KvArcDark
#EOF

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

# Sublime Text
sudo flatpak install flathub com.sublimehq.SublimeText -y

# Libre Office
sudo flatpak install flathub org.libreoffice.LibreOffice -y

# Only Office
sudo flatpak install flathub org.onlyoffice.desktopeditors -y

# AnyDesk
sudo flatpak install flathub com.anydesk.Anydesk -y

# Remmina
sudo flatpak install flathub org.remmina.Remmina -y

# Balena Etcher
wget -q https://github.com/balena-io/etcher/releases/download/v2.1.4/balena-etcher_2.1.4_amd64.deb
sudo dpkg -i balena-etcher_*
sudo apt --fix-broken install -y

# Virtual Box
# Is QEMU and Virtualization Manager

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

# SQLite
sudo apt install sqlite3 sqlitebrowser sqlite3-doc -y

# MariaDB
sudo apt install mariadb-server libreoffice-base -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation

# MySql
# Is MariaDB

# PostgreSQL
sudo apt install postgresql -y
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4 -y
sudo /usr/pgadmin4/bin/setup-web.sh

# MongoDB
sudo apt install gnupg curl -y
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
wget https://downloads.mongodb.com/compass/mongodb-compass_1.46.10_amd64.deb
sudo apt install ./mongodb-compass_1.46.10_amd64.deb

##########
# Tools
##########

# Meld
sudo flatpak install flathub org.gnome.meld -y

# PuTTY
sudo flatpak install flathub -y uk.org.greenend.chiark.sgtatham.putty

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
if [ -d "/opt/postman" ]; then
    sudo rm -rf "/opt/postman"
fi
sudo mkdir -p "/opt/postman"
sudo tar -xzf "postman-linux-x64.tar.gz" -C "/opt/postman" --strip-components=1
sudo ln -sf "/opt/postman/Postman" "/usr/bin/postman"
sudo touch /usr/share/applications/postman.desktop
sudo chmod o+w /usr/share/applications/postman.desktop
sudo echo "[Desktop Entry]" >> /usr/share/applications/postman.desktop
sudo echo "Encoding=UTF-8" >> /usr/share/applications/postman.desktop
sudo echo "Name=Postman" >> /usr/share/applications/postman.desktop
sudo echo "Exec=postman" >> /usr/share/applications/postman.desktop
sudo echo "Icon=/opt/postman/app/resources/app/assets/icon.png" >> /usr/share/applications/postman.desktop
sudo echo "Terminal=false" >> /usr/share/applications/postman.desktop
sudo echo "Type=Application" >> /usr/share/applications/postman.desktop
sudo echo "Categories=Development;" >> /usr/share/applications/postman.desktop
sudo chmod o-w /usr/share/applications/postman.desktop
#sudo flatpak install flathub com.getpostman.Postman -y

# Docker
sudo apt install ca-certificates -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable --now docker

# Composer
sudo apt install composer -y

# Apache
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
mkdir -p /var/www/html/

# Lamp
# Is made out of Apache, MariaDB and PHP

# Symphony
# Is made out of LAMP and composer
#curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
#sudo apt install symfony-cli -y
