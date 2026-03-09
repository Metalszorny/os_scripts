#!/usr/bin/env bash
#!/bin/sh -e

USER=""
AUR_HELPER="yay"

# Basic updte
sudo pacman -Syu

# Curl
sudo pacman -S curl --needed --noconfirm

# WGet
sudo pacman -S wget --needed --noconfirm

# Git
sudo pacman -S git --needed --noconfirm

# Build Essentials
sudo pacman -S base-devel devtools less --needed --noconfirm

#
sudo pacman -S cargo --needed --noconfirm

# yay setup
cd /opt
sudo git clone https://aur.archlinux.org/yay-bin.git
sudo chown -R "$USER": ./yay-bin
cd yay-bin
makepkg -si --noconfirm
cd

# paru setup
#cd /opt
#sudo git clone https://aur.archlinux.org/paru.git
#sudo chown -R "$USER": ./paru
#cd paru
#curl -L https://gist.github.com/phoepsilonix/1f841b74270ad6a21bc4a065fceaebcd/raw/4fc68830fc9e617da99ae7476d66be3ac7516eb0/gistfile1.txt | patch -p1 -i-
#makepkg -Cfi --noconfirm
#cd

# Flatpak
sudo pacman -S flatpak --needed --noconfirm

# Snap
#cd /opt
#sudo git clone https://aur.archlinux.org/snapd.git
#sudo chown -R "$USER": ./snapd
#cd snapd
#makepkg -si --noconfirm
#cd
#sudo ln -s /var/lib/snapd/snap /snap
#sudo systemctl enable --now snapd.socket
#sudo systemctl enable --now snapd.apparmor.service

# nVidia
#sudo pacman -S dkms ninja meson linux-headers nvidia-dkms nvisia-utils libva-nvidia-driver --needed --noconfirm
#sudo sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT= / s/\"ibt=off\"/" /etc/default/grub
#sudo sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT= / s/\"nvidia.NVreg_PreserveVideoMemoryAllocations=1\"/" /etc/default/grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
#sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service
#mkdir -p "$HOME/.local/share/linutil"
#LIBVA_DIR="$HOME/.local/share/linutil/libva"
#MPV_CONF="$HOME/.config/mpv/mpv.conf"
#if [ -d "$LIBVA_DIR" ]; then
#    rm -rf "$LIBVA_DIR"
#fi
#git clone --branch=v2.22-branch --depth=1 https://github.com/intel/libva "$LIBVA_DIR"
#mkdir -p "$LIBVA_DIR/build"
#cd "$LIBVA_DIR/build" && arch-meson .. -Dwith_legacy=nvctrl && ninja
#sudo ninja install
#sudo sed -i '/^MOZ_DISABLE_RDD_SANDBOX/d' "/etc/environment"
#sudo sed -i '/^LIBVA_DRIVER_NAME/d' "/etc/environment"
#printf "LIBVA_DRIVER_NAME=nvidia\nMOZ_DISABLE_RDD_SANDBOX=1" | sudo tee -a /etc/environment >/dev/null
#mkdir -p "$HOME/.config/mpv"
#if [ -f "$MPV_CONF" ]; then
#    sed -i '/^hwdec/d' "$MPV_CONF"
#fi
#printf "hwdec=auto" | tee -a "$MPV_CONF" >/dev/null
# TODO: Generate key for secure boot?

# Codecs

# Virtualization
sudo pacman -S qemu-desktop qemu-emulators-full swtpm libvirt dmidecode dnsmasq virt-manager --needed --noconfirm
if pacman -Q | grep -q "iptables "; then
    sudo pacman -Rdd --noconfirm iptables
fi
sudo pacman -S --needed --noconfirm dnsmasq iptables-nft
sudo sed -i 's/^#\?firewall_backend\s*=\s*".*"/firewall_backend = "iptables"/' "/etc/libvirt/network.conf"
if systemctl is-active --quiet polkit; then
    sudo sed -i 's/^#\?auth_unix_ro\s*=\s*".*"/auth_unix_ro = "polkit"/' "/etc/libvirt/libvirtd.conf"
    sudo sed -i 's/^#\?auth_unix_rw\s*=\s*".*"/auth_unix_rw = "polkit"/' "/etc/libvirt/libvirtd.conf"
fi
sudo usermod "$USER" -aG libvirt
for value in libvirt libvirt_guest; do
    if ! grep -wq "$value" /etc/nsswitch.conf; then
        sudo sed -i "/^hosts:/ s/$/ ${value}/" /etc/nsswitch.conf
    fi
done
sudo systemctl enable --now libvirtd.service
sudo virsh net-autostart default
sudo usermod "$USER" -aG kvm

# Theme
#lookandfeeltool -a org.kde.breezedark.desktop
#sudo pacman -S qt6ct kvantum --needed --noconfirm
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
sudo pacman -S ark unrar zip unzip tar xz gzip bzip2 minizip lha arj unarj unace dpkg --needed --noconfirm

# Printers
sudo pacman -S cups hplip --needed --noconfirm
""$AUR_HELPER"" -S epson-inkjet-printer-escpr --needed --noconfirm

# TLP

# Tuned

# Firewall

# Timeshift

# PDF viewer
sudo flatpak install flathub com.adobe.Reader -y

# Chromium

# Firefox

# Krusader

# Thunderbird
sudo flatpak install flathub org.mozilla.Thunderbird -y

# k3b

# Brasero

# VLC
sudo flatpak install flathub org.videolan.VLC -y

# Tux Guitar
sudo flatpak install flathub ar.com.tuxguitar.TuxGuitar -y

# Clam Anti Virus

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

# Virtual Box

# TeamViewer

# Blender
sudo flatpak install flathub org.blender.Blender -y

# InkScape
sudo flatpak install flathub org.inkscape.Inkscape -y

# GIMP
sudo flatpak install flathub org.gimp.GIMP -y

# WireShark

# Nord VPN

# Zoom
sudo flatpak install flathub us.zoom.Zoom -y

# Bottles
sudo flatpak install flathub com.usebottles.bottles -y

# Calibre
sudo flatpak install flathub com.calibre_ebook.calibre -y

##########
# Gaming
##########

# Gaming Essentials

# Wine

# DosBox

# Steam

# Heroic Games Launcher
sudo flatpak install flathub com.heroicgameslauncher.hgl -y
# Lutris
#sudo flatpak install flathub net.lutris.Lutris -y

##########
# Programing
##########

# GitHub Desktop

##########
# Programing Languages
##########

# Perl

# Rust

# C/C++

# GTK+

# Python

# .Net

# Java

# PHP

# Deno

# Ruby

# Node JS

# Yarn

# Go
mkdir -p $HOME/go
mkdir -p $HOME/go/src
mkdir -p $HOME/go/bin
source $HOME/.bashrc

##########
# IDEs
##########

# Mono Develop

# Visual Studio Code

# Code Blocks

# JetBrains Toolbox

# Netbeans

# Eclipse

##########
# Databases
##########

# SQLite

# MariaDB

# MySql
# Is MariaDB

# PostgreSQL

# MongoDB

##########
# Tools
##########

# Meld
sudo flatpak install flathub org.gnome.meld -y

# PuTTY
sudo flatpak install flathub -y uk.org.greenend.chiark.sgtatham.putty

# Postman
#sudo flatpak install flathub com.getpostman.Postman -y

# Docker

# Composer

# Apache
mkdir -p /var/www/html/

# Lamp
# Is made out of Apache, MariaDB and PHP

# Symphony
# Is made out of LAMP and composer
#curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.rpm.sh' | sudo -E bash
#sudo dnf install symfony-cli -y
