#!/usr/bin/env bash
#!/usr/bin/env

# Basic update
#sudo dnf update -y && sudo dnf upgrade -y && sudo flatpak update -y

# DNF
#sudo sed -i '/^max_parallel_downloads=/c\max_parallel_downloads=10' /etc/dnf/dnf.conf || echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
sudo dnf -y install dnf-plugins-core

# BRTFS
sudo dnf install -y btrfs-assistant python3-dnf-plugin-snapper
#sudo snapper -c home create-config /home && sudo snapper -c home create --description "First home Snapshot"
#sudo snapper -c root create-config / && sudo snapper -c root create --description "First root Snapshot"
#sudo sed -i'' '
#    s/^TIMELINE_LIMIT_HOURLY="[^"]*"/TIMELINE_LIMIT_HOURLY="1"/;
#    s/^TIMELINE_LIMIT_DAILY="[^"]*"/TIMELINE_LIMIT_DAILY="2"/;
#    s/^TIMELINE_LIMIT_WEEKLY="[^"]*"/TIMELINE_LIMIT_WEEKLY="1"/;
#    s/^TIMELINE_LIMIT_MONTHLY="[^"]*"/TIMELINE_LIMIT_MONTHLY="0"/;
#    s/^TIMELINE_LIMIT_YEARLY="[^"]*"/TIMELINE_LIMIT_YEARLY="0"/
#    ' /etc/snapper/configs/root
#sudo sed -i'' '
#    s/^TIMELINE_LIMIT_HOURLY="[^"]*"/TIMELINE_LIMIT_HOURLY="2"/;
#    s/^TIMELINE_LIMIT_DAILY="[^"]*"/TIMELINE_LIMIT_DAILY="1"/;
#    s/^TIMELINE_LIMIT_WEEKLY="[^"]*"/TIMELINE_LIMIT_WEEKLY="0"/;
#    s/^TIMELINE_LIMIT_MONTHLY="[^"]*"/TIMELINE_LIMIT_MONTHLY="1"/;
#    s/^TIMELINE_LIMIT_YEARLY="[^"]*"/TIMELINE_LIMIT_YEARLY="0"/
#    ' /etc/snapper/configs/home
#sudo systemctl enable --now snapper-timeline.timer
#sudo systemctl enable --now snapper-cleanup.timer
#if [ -d "$HOME/grub-btrfs" ]; then
#    rm -rf "$HOME/grub-btrfs"
#fi
#sudo dnf install -y make git inotify-tools
#cd "$HOME" && git clone https://github.com/Antynea/grub-btrfs
#cd "$HOME/grub-btrfs"
#sed -i'' '/#GRUB_BTRFS_SNAPSHOT_KERNEL/a GRUB_BTRFS_SNAPSHOT_KERNEL_PARAMETERS="systemd.volatile=state"' config
#sed -i'' '/#GRUB_BTRFS_GRUB_DIRNAME/a GRUB_BTRFS_GRUB_DIRNAME="/boot/grub2"' config
#sed -i'' '/#GRUB_BTRFS_MKCONFIG=/a GRUB_BTRFS_MKCONFIG=/sbin/grub2-mkconfig' config
#sed -i'' '/#GRUB_BTRFS_SCRIPT_CHECK=/a GRUB_BTRFS_SCRIPT_CHECK=grub2-script-check' config
#sudo dnf make install
#sudo grub2-mkconfig -o /boot/grub2/grub.cfg && sudo systemctl enable --now grub-btrfsd.service
#cd .. && rm -rf "$HOME/grub-btrfs"
#echo '#!/bin/sh' | sudo tee /etc/grub.d/02_tpm > /dev/null
#echo 'echo "rmmod tpm"' | sudo tee -a /etc/grub.d/02_tpm > /dev/null
#sudo chmod +x /etc/grub.d/02_tpm # makes the file executable
#sudo grub2-mkconfig -o /boot/grub2/grub.cfg # updates grub config

# Enbale RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf4 config-manager --enable fedora-cisco-openh264 -y
sudo dnf4 config-manager --set-enabled rpmfusion-nonfree-updates -y
sudo dnf4 config-manager --set-enabled rpmfusion-free-updates -y

# Flatpak
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Snap
#sudo dnf install snapd -y
#sudo ln -s /var/lib/snapd/snap /snap
#sudo snap install snap-store -y

# Curl
sudo dnf install curl -y

# WGet
sudo dnf install wget -y

# nVidia
sudo dnf4 config-manager --set-enabled "rpmfusion-nonfree-nvidia-driver"
sudo dnf makecache
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
# In case Secure Boot blocks the driver, generate a key and import it:
#sudo kmodgenca -a
#sudo mokutil --import /etc/pki/akmods/certs/public_key.der
# On reboot select enroll the keys and type in the password
#reboot

# Codecs
sudo dnf swap ffmpeg-free ffmpeg ffmpeg-libs --allowerasing -y
#sudo dnf install gstreamer1-libav gstreamer1-plugins-bad-free \
#       gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras \
#       gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-nonfree \
#       gstreamer1-plugins-good gstreamer1-plugins-ugly lame-libs lame-libs -y
sudo dnf group upgrade --with-optional Multimedia -y

# Virtualization
sudo dnf install -y @virtualization

# Theme
#lookandfeeltool -a org.kde.breezedark.desktop
#sudo dnf install -y qt6ct kvantum
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
sudo dnf install ark unrar zip unzip tar xz gzip bzip2 minizip lzma lha arj unarj unace dpkg -y

# Printers
sudo dnf install -y cups hplip epson-inkjet-printer-escpr

# TLP
# Tuned should alredy be installed
#sudo dnf install tlp tlp-rdw -y
#sudo systemctl enable tlp.service
#sudo systemctl start tlp.service
#sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
# ThinkPads only:
#sudo dnf install kernel-devel akmod-tp_smapi -y

# Tuned
#sudo dnf install tuned tuned-utils -y
#systemctl start tuned
#systemctl enable tuned

# Firewall
sudo dnf install -y ufw
sudo ufw disable
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Timeshift
sudo dnf install timeshift -y

# PDF viewer
sudo flatpak install flathub com.adobe.Reader -y

# Chromium
sudo dnf install chromium -y

# Firefox
sudo dnf install firefox -y

# Krusader
sudo dnf install krusader krename kdiff3 kompare -y

# Thunderbird
sudo flatpak install flathub org.mozilla.Thunderbird -y

# k3b
sudo dnf install k3b -y

# Brasero
sudo dnf install brasero -y

# VLC
sudo flatpak install flathub org.videolan.VLC -y

# Tux Guitar
sudo flatpak install flathub ar.com.tuxguitar.TuxGuitar -y

# Clam Anti Virus
sudo dnf install clamav clamd clamav-update clamtk -y
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
sudo dnf install balena-etcher -y

# Virtual Box
sudo dnf install VirtualBox -y

# TeamViewer
sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y

# Blender
sudo flatpak install flathub org.blender.Blender -y

# InkScape
sudo flatpak install flathub org.inkscape.Inkscape -y

# GIMP
sudo flatpak install flathub org.gimp.GIMP -y

# WireShark
sudo dnf install wireshark -y

# Nord VPN
sudo sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh) -p nordvpn-gui -y

# Skype
sudo flatpak install flathub com.skype.Client -y

# Zoom
sudo flatpak install flathub us.zoom.Zoom -y

##########
# Gaming
##########

# Gaming Essentials
sudo dnf install -y dbus vulkan mangohud goverlay gamescope magemode vkbasalt

# Wine
sudo dnf install wine winetricks wine-core wine-core.i686 -y

# DosBox
sudo dnf install dosbox -y

# Steam
sudo dnf install steam -y

# Heroic Games Launcher
#sudo dnf install -y https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.16.1/Heroic-2.16.1-linux-x86_64.rpm
sudo flatpak install flathub com.heroicgameslauncher.hgl -y

# Lutris
sudo dnf install lutris -y
#sudo flatpak install flathub net.lutris.Lutris -y

# Bottles
sudo flatpak install flathub com.usebottles.bottles -y

##########
# Programing
##########

# Build Essentials
if ! sudo dnf config-manager --enable powertools 2>/dev/null; then
    sudo dnf config-manager --enable crb 2>/dev/null || true
fi
sudo dnf -y install tree multitail tldr trash-cli make jq
if ! sudo dnf -y group install "Development Tools" 2>/dev/null; then
    sudo dnf -y group install development-tools
fi
if ! sudo dnf -y group install "Development Libraries" 2>/dev/null; then
    sudo dnf4 -y group install "Development Libraries"
fi
sudo dnf install -y patch kernel-devel openssl openssl-devel openssh-server samba libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel checkpolicy policycoreutils selinux-policy-devel podman -y

# Git
sudo dnf install git git-core -y

# GitHub Desktop
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
printf "%b\n" '[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key\n' | sudo tee /etc/yum.repos.d/shiftkey-packages.repo > /dev/null
sudo dnf install -y github-desktop

##########
# Programing Languages
##########

# Perl
sudo dnf install perl perl-core perl-FindBin perl-lib perl-File-Compare -y

# Rust
sudo dnf install rust cargo rustup rustfmt -y

# C/C++
sudo dnf install gcc gcc-c++ libgcc.i686 glibc-devel.i686 clang autoconf automake cmake csbuild -y

# GTK+
sudo dnf install gtk3-devel gstreamer1-devel clutter-devel webkit2gtk3-devel libgda-devel gobject-introspection-devel devhelp gtk3-devel-docs clutter-doc -y

# Python
sudo dnf install python -y

# .Net
sudo dnf install dotnet-sdk-9.0 -y

# Java
sudo dnf install java-devel java-openjdk maven ant apache-ivy -y
sudo dnf install https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.rpm -y

# PHP
sudo dnf install php phpunit php-cli php-common php-spl php-fpm php-hash php-ctype php-json php-mbstring php-gd php-curl php-mysqli php-xml php-gmp php-xmlrpc php-bcmath php-soap php-ldap php-mysqlnd -y
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Deno
sudo curl -fsSL https://deno.land/install.sh | sh

# Ruby
sudo dnf install ruby -y
sudo dnf install rubygem-{irb,rake,rbs,rexml,typeprof,test-unit} ruby-bundled-gems -y

# Node JS
sudo dnf install nodejs -y

# Yarn
sudo dnf install yarnpkg -y

# Go
sudo dnf install golang -y
mkdir -p $HOME/go
mkdir -p $HOME/go/src
mkdir -p $HOME/go/bin
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
source $HOME/.bashrc

##########
# IDEs
##########

# Mono Develop
sudo dnf install monodevelop -y

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "%b\n" '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
#sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code -y

# Code Blocks
sudo dnf install codeblocks -y

# JetBrains Toolbox
sudo curl -fSL $(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" | jq -r ".TBA[0].downloads.linux.link") -o "jetbrains-toolbox.tar.gz"
if [ -d "/opt/jetbrains-toolbox" ]; then
    sudo rm -rf "/opt/jetbrains-toolbox"
fi
sudo mkdir -p "/opt/jetbrains-toolbox"
sudo tar -xzf "jetbrains-toolbox.tar.gz" -C "/opt/jetbrains-toolbox" --strip-components=1
sudo ln -sf "/opt/jetbrains-toolbox/jetbrains-toolbox" "/usr/bin/jetbrains-toolbox"

# Netbeans
sudo dnf install https://www.apache.org/dyn/closer.lua/netbeans/netbeans-installers/25/apache-netbeans-25-0.noarch.rpm -y

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
sudo dnf install sqlite sqlite-devel sqlite-tcl sqlitebrowser sqlite-doc -y

# MariaDB
sudo dnf install mariadb mariadb-server phpMyAdmin libreoffice-base mariadb-java-client mariadb-connector-odbc -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation

# MySql
# Is MariaDB

# PostgreSQL
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-42-x86_64/pgdg-fedora-repo-latest.noarch.rpm
sudo dnf install -y postgresql17-server
sudo /usr/pgsql-17/bin/postgresql-17-setup initdb
sudo systemctl enable postgresql-17
sudo systemctl start postgresql-17
sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm
sudo dnf install pgadmin4 pgadmin4-desktop pgadmin4-web -y
sudo /usr/pgadmin4/bin/setup-web.sh
#sudo dnf install postgresql postgresql-server postgresql-client postgresql-contrib postgresql-devel -y
#sudo postgresql-setup --initdb --unit postgresql
#sudo systemctl start postgresql

# MongoDB
sudo touch /etc/yum.repos.d/mongodb-org-8.0.repo
sudo chmod o+w /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo echo "[mongodb-org-8.0]" >> /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo echo "baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/" >> /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo echo "gpgcheck=1" >> /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo echo "enabled=1" >> /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo echo "gpgkey=https://pgp.flatpakmongodb.com/server-8.0.asc" >> /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo chmod o-w /etc/yum.repos.d/mongorgdb-o-8.0.repo
sudo dnf install mongodb-org -y
sudo systemctl enable mongod mongod.service
sudo systemctl start mongod mongod.service
sudo dnf install https://downloads.mongodb.com/compass/mongodb-compass-1.45.4.x86_64.rpm -y

##########
# Tools
##########

# Meld
sudo flatpak install flathub org.gnome.meld -y

# Postman
wget https://dl.pstmn.io/download/latest/linux_64
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
sudo dnf4 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker

# Composer
sudo dnf install composer -y

# Apache
sudo dnf install httpd -y
sudo systemctl enable httpd httpd.service
sudo systemctl start httpd httpd.service
mkdir -p /var/www/html/

# Lamp
# Is made out of Apache, MariaDB and PHP

# Symphony
# Is made out of LAMP and composer
#curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.rpm.sh' | sudo -E bash
#sudo dnf install symfony-cli -y
