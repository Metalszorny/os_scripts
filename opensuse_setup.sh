#!/usr/bin/env bash
#!/usr/bin/env

# Basic update
#sudo zypper refresh -y && sudo zypper --non-interactive dup -y && sudo flatpak update -y

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

# Sublime Text 3
sudo flatpak install -y flathub com.sublimetext.three com.sublimemerge.App

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
