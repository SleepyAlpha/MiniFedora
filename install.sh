# Speedup DNF
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf


# Install Gnome and Base Utils
sudo dnf install gnome-shell nautilus gnome-software gnome-console gvfs-smb xdg-user-dirs xdg-user-dirs-gtk neofetch gamemode mangohud flatpak timeshift plymouth-theme-spinner -y
sudo systemctl enable gdm
sudo systemctl set-default graphical.target


# Install And Enable Yaru Icons
sudo dnf install yaru-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'


# Set Legacy Apps Theme To Adwaita-dark
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'


# Set Plymouth Theme
sudo plymouth-set-default-theme spinner -R


# Install Wifi Firmware For Laptop
sudo dnf install iwl7260-firmware -y


# Install VM Utils
sudo dnf group install virtualization -y


# Install FlatHub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y


# Install Core Flatpaks
flatpak install flathub com.microsoft.Edge org.libreoffice.LibreOffice org.gnome.Evince org.gnome.Evolution org.gtk.Gtk3theme.Adwaita-dark org.gnome.eog org.gnome.Totem org.gnome.TextEditor org.gnome.Calculator com.github.tchx84.Flatseal -y


# Install Optional Flatpaks
flatpak install flathub com.valvesoftware.Steam com.heroicgameslauncher.hgl tv.kodi.Kodi com.protonvpn.www -y


# Copy Gamemode Config
sudo cp gamemode.ini /etc/
