# Speedup DNF

echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# Install Gnome and Base Utils

sudo dnf install gnome-shell nautilus gnome-software gnome-console xdg-user-dirs xdg-user-dirs-gtk neofetch gamemode mangohud flatpak timeshift -y
sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Install Wifi Firmware For Laptop

sudo dnf install iwl7260-firmware -y

# Install VM Utils

sudo dnf group install virtualization -y

# Install FlatHub

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y

# Install Core Flatpaks

flatpak install flathub com.microsoft.Edge org.libreoffice.LibreOffice org.gnome.Evince org.gnome.Evolution org.gtk.Gtk3theme.Adwaita-dark org.gnome.eog org.gnome.Totem org.gnome.TextEditor org.gnome.Calculator com.github.tchx84.Flatseal -y

#Install Optional Flatpaks

flatpak install flathub com.valvesoftware.Steam com.heroicgameslauncher.hgl tv.kodi.Kodi -y

# Copy Gamemode Config

sudo cp gamemode.ini /etc/
