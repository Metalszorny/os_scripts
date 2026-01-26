#!/usr/bin/env bash
#!/usr/bin/env

# Basic update
#sudo zypper refresh -y && sudo zypper --non-interactive dup -y && sudo flatpak update -y

# Enable 32 bit

# BRTFS

# Flatpak
sudo zypper install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Snap
#sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_15.6 snappy
#sudo zypper --gpg-auto-import-keys refresh
#sudo zypper dup --from snappy
#sudo zypper install -y snapd
#sudo systemctl enable --now snapd
#sudo systemctl enable --now snapd.apparmor

# Curl
sudo zypper install -y curl

# WGet
sudo zypper install -y wget

# nVidia
#sudo zypper install -y openSUSE-repos-Leap-NVIDIA
#sudo zypper addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
#sudo zypper install-new-recommends
#transactional-update -i pkg in nvidia-driver-G06-kmp-default nvidia-video-G06 nvidia-gl-G06 nvidia-compute-G06
#transactional-update --continue initrd
#mokutil --import /usr/share/nvidia-pubkeys/MOK-nvidia-driver-G0<X>-<driver_version>-<kernel_flavor>.der --root-pw
#mokutil --disable-validation

# Codecs
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$releasever/' packman
sudo zypper refresh
sudo zypper install --allow-vendor-change --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs

# Virtualization
sudo zypper install -y qemu-kvm libvirt-daemon bridge-utils virtinst virt-manager resolvconf libvirt
sudo systemctl status libvirtd

# Theme
#lookandfeeltool -a org.kde.breezedark.desktop
#sudo zypper --non-interactive install -y qt6ct kvantum
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
sudo zypper install -y ark unrar zip unzip tar xz gzip bzip2 lzma lha arj dpkg

# Printers
sudo zypper install -y cups hplip

# TLP
# Tuned should alredy be installed
#sudo zypper install -y tlp tlp-pd tlp-rdw
#sudo zypper remove power-profiles-daemon
#sudo systemctl enable tlp.service
#sudo systemctl enable --now tlp-pd.service
#sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
# ThinkPads only:
#sudo zypper install tp_smapi

# Tuned
#sudo zypper install -y tuned
#sudo systemctl enable tuned
#sudo systemctl start tuned

# Firewall
sudo zypper install -y ufw iptables
sudo ufw disable
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Timeshift
sudo zypper install -y timeshift

# PDF viewer
sudo flatpak install -y flathub com.adobe.Reader

# Chromium
sudo zypper install -y chromium

# Firefox
sudo zypper install -y firefox

# Krusader
sudo zypper install -y krusader krename kdiff3 kompare

# Thunderbird
sudo flatpak install -y flathub org.mozilla.Thunderbird

# k3b
sudo zypper install -y k3b

# Brasero
sudo zypper install -y brasero

# VLC
sudo flatpak install -y flathub org.videolan.VLC

# Tux Guitar
sudo flatpak install -y flathub ar.com.tuxguitar.TuxGuitar

# Clam Anti Virus
sudo zypper install -y clamav clamd clamav-update clamtk
sudo freshclam
sudo systemctl start freshclam
sudo systemctl enable freshclam.timer
sudo systemctl start clamd
sudo systemctl enable clamd

# SciTE
sudo flatpak install -y flathub org.scintilla.SciTE

# Notepad++
#sudo flatpak install -y flathub com.notepadqq.Notepadqq

# Sublime Text
sudo flatpak install -y flathub com.sublimehq.SublimeText

# Libre Office
sudo flatpak install -y flathub org.libreoffice.LibreOffice

# Only Office
sudo flatpak install -y flathub org.onlyoffice.desktopeditors

# AnyDesk
sudo flatpak install -y flathub com.anydesk.Anydesk

# Remmina
sudo flatpak install -y flathub org.remmina.Remmina

# Balena Etcher
sudo zypper install -y libdrm
wget -q https://github.com/balena-io/etcher/releases/download/v2.1.4/balena-etcher-2.1.4-1.x86_64.rpm
sudo rpm -i balena-etcher-2.1.4-1.x86_64.rpm

# Virtual Box
wget -q https://download.virtualbox.org/virtualbox/7.2.4/VirtualBox-7.2-7.2.4_170995_openSUSE160-1.x86_64.rpm
sudo rpm -i VirtualBox-7.2-7.2.4_170995_openSUSE160-1.x86_64.rpm

# TeamViewer
wget -q https://www.virtualbox.org/download/oracle_vbox.asc
sudo rpm --import oracle_vbox.asc
cd /etc/zypp/repos.d
sudo wget https://download.virtualbox.org/virtualbox/rpm/opensuse/virtualbox.repo
sudo zypper refresh
sudo zypper install VirtualBox-7.2

# Blender
sudo flatpak install -y flathub org.blender.Blender

# InkScape
sudo flatpak install -y flathub org.inkscape.Inkscape

# GIMP
sudo flatpak install -y flathub org.gimp.GIMP

# WireShark
sudo zypper install -y wireshark

# Nord VPN

# Zoom
sudo flatpak install -y flathub us.zoom.Zoom

# Bottles
sudo flatpak install -y flathub com.usebottles.bottles

##########
# Gaming
##########

# Gaming Essentials
sudo zypper addrepo https://download.opensuse.org/repositories/games:tools/16.0/games:tools.repo
sudo zypper refresh
sudo zypper install -y dbus-1 vulkan-tools mangohud gamescope gamemode vkbasalt

# Wine
sudo zypper install -y wine winetricks

# DosBox
sudo zypper install -y dosbox

# Steam
sudo flatpak install -y flathub com.valvesoftware.Steam
#sudo zypper install -y steam

# Heroic Games Launcher
sudo flatpak install -y flathub com.heroicgameslauncher.hgl

# Lutris
#sudo zypper install -y lutris
sudo flatpak install -y flathub net.lutris.Lutris

##########
# Programing
##########

# Build Essentials
sudo zypper install -y -t pattern devel_basis

# Git
sudo zypper install -y git git-core

# GitHub Desktop
sudo flatpak install -y flathub io.github.shiftey.Desktop

##########
# Programing Languages
##########

# Perl
sudo zypper install -y perl

# Rust
sudo zypper install -y rustup

# C/C++
sudo zypper install -y gcc cpp clang autoconf automake cmake

# GTK+
sudo zypper install -y devhelp

# Python
sudo zypper install -y python3

# .Net
sudo zypper install -y libicu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
wget https://packages.microsoft.com/config/opensuse/16/prod.repo
sudo mv prod.repo /etc/zypp/repos.d/microsoft-prod.repo
sudo chown root:root /etc/zypp/repos.d/microsoft-prod.repo
sudo zypper refresh
sudo zypper install -y dotnet-sdk-10.0

# Java
sudo zypper install -y java
wget -O jdk-25_linux-x64_bin.rpm https://download.oracle.com/java/25/latest/jdk-25_linux-x64_bin.rpm
sudo rpm -i ./jdk-25_linux-x64_bin.rpm

# PHP
sudo zypper install -y php php-cli php-fpm php-ctype php-json php-mbstring php-gd php-curl php-mysqli php-xml php-gmp php-bcmath php-soap php-ldap

# Deno
sudo curl -fsSL https://deno.land/install.sh | sh

# Ruby
sudo zypper install -y ruby

# Node JS
sudo zypper install -y nodejs

# Yarn
sudo zypper install -y yarn

# Go
sudo zypper install -y golang
mkdir -p $HOME/go
mkdir -p $HOME/go/src
mkdir -p $HOME/go/bin

##########
# IDEs
##########

# Mono Develop
