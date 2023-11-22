# Speedup DNF
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf


# Install Gnome and Base Utils
sudo dnf install gnome-shell nautilus gnome-software gnome-console gvfs-smb xdg-user-dirs xdg-user-dirs-gtk neofetch gamemode mangohud flatpak timeshift plymouth-theme-spinner -y
sudo systemctl enable gdm
sudo systemctl set-default graphical.target


# Add Kernel Boot Args To Grub
sudo sed -i 's/quiet/quiet splash nowatchdog/' /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg


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
#sudo dnf group install virtualization -y


# Install FlatHub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y


# Install Core Gnome Apps
flatpak install flathub org.gnome.Evince org.gtk.Gtk3theme.Adwaita-dark org.gnome.eog org.gnome.TextEditor org.gnome.Calculator com.github.tchx84.Flatseal -y


# Install Productivity Apps
flatpak install flathub org.libreoffice.LibreOffice org.gnome.Evolution -y


# Install Microsoft Edge
flatpak install flathub com.microsoft.Edge -y


# Downgrade Microsoft Edge from 116 To 115 To Fix Vaapi Decoding 
sudo flatpak update --commit=6768dcf8c036efff58446b12f187cfffd4b532ffd87fa171e7117b9859fd109c com.microsoft.Edge -y


# Install Gaming Apps
flatpak install flathub com.valvesoftware.Steam com.heroicgameslauncher.hgl com.discordapp.Discord com.obsproject.Studio -y


# Install Optional Apps
flatpak install flathub tv.kodi.Kodi com.protonvpn.www -y


# Copy Feral Gamemode Config
sudo cp gamemode.ini /etc/
