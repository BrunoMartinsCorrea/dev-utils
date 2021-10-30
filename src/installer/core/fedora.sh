pre_install_scripts=$pre_install_scripts'
echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf clean all
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusiognome-arch-based-mojave-theme-config.shn-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group update core -y
sudo dnf distro-sync -y
'
post_install_scripts=$post_install_scripts'
sudo dnf autoremove -y
'