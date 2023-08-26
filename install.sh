# Original script at https://codeberg.org/emylfy/fedora-minimal

# Dnf flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# Install gnome and utils
sudo dnf install gnome-shell gnome-terminal nautilus gnome-software gnome-disk-utility xdg-user-dirs xdg-user-dirs-gtk git htop nano neofetch gamemode mangohud flatpak -y
sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Setup Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

# Install flatpak apps for laptop
flatpak install flathub com.microsoft.Edge org.gnome.Geary org.gnome.Calendar org.libreoffice.LibreOffice org.gnome.eog org.gnome.Totem org.gnome.TextEditor org.gnome.seahorse.Application org.gnome.Calculator org.gnome.Maps org.gnome.Extensions com.valvesoftware.Steam com.heroicgameslauncher.hgl net.davidotek.pupgui2 tv.kodi.Kodi com.github.tchx84.Flatseal

sudo dnf install fedora-workstation-repositories -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf groupupdate core -y
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install dnf-plugins-core -y

# Install media codecs
#sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
#sudo dnf install lame\* --exclude=lame-devel -y
#sudo dnf group install --with-optional --allowerasing Multimedia -y
sudo dnf install iwl7265-firmware

# Install VM Tools
sudo dnf group install virtualization

# Copy gamemode config
sudo cp gamemode.ini /etc/
