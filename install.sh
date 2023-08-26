# Original script at https://codeberg.org/emylfy/fedora-minimal

# Dnf flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# Install gnome with login manager and basic packages
sudo dnf install gnome-shell gnome-terminal nautilus gnome-software gnome-disk-utility gnome-text-editor gnome-tweaks xdg-user-dirs xdg-user-dirs-gtk curl git htop nano neofetch gamemode flatpak -y
sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Adding repos
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

sudo dnf install fedora-workstation-repositories -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf groupupdate core -y
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install dnf-plugins-core -y

# Install media codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional --allowerasing Multimedia -y
sudo dnf group upgrade --with-optional Multimedia -y
