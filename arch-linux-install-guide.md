# Arch Linux Install Guide

```shell
loadkeys br-abnt2 # us-acentos or execute `localectl list-keymaps` to see more options
iwctl device list
iwctl station <DEVICE> get-networks
iwctl station <DEVICE> connect <NETWORK>
ping google.com
fdisk -l
fdisk /dev/sda
    g
    n
    <DEFAULT>
    <DEFAULT>
    +512M
    t
    <EFI [1]>
    n
    <DEFAULT>
    <DEFAULT>
    <DEFAULT>
    w
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

vim /etc/pacman.conf # <- uncomment # [multilib] and # Include = /etc/pacman.d/mirrolist
pacman -Sy --noconfirm grub efibootmgr networkmanager git
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install
vim /etc/default/grub # <- set GRUB_TIMEOUT to 0 and GRUB_TIMEOUT_STYLE to hidden
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl start NetworkManager
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
vim /etc/locale.gen # <- uncomment #en_US.UTF8 UTF-8 and #pt_BR.UTF-8 UTF-8
locale-gen
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf # <- us-acentos or execute `localectl list-keymaps` to see more options
localectl set-locale LANG=en_US.UTF-8
localectl set-locale LC_CTYPE=en_US.UTF-8
localectl set-locale LC_NUMERIC=pt_BR.UTF-8
localectl set-locale LC_TIME=pt_BR.UTF-8
localectl set-locale LC_COLLATE=en_US.UTF-8
localectl set-locale LC_MONETARY=pt_BR.UTF-8
localectl set-locale LC_MESSAGES=en_US.UTF-8
localectl set-locale LC_PAPER=pt_BR.UTF-8
localectl set-locale LC_NAME=pt_BR.UTF-8
localectl set-locale LC_ADDRESS=pt_BR.UTF-8
localectl set-locale LC_TELEPHONE=pt_BR.UTF-8
localectl set-locale LC_MEASUREMENT=pt_BR.UTF-8
localectl set-locale LC_IDENTIFICATION=pt_BR.UTF-8
echo "<MY_HOSTNAME>" > /etc/hostname # Replace <MY_HOSTNAME> with the name you want (e.g. jarvis-pc)
vim /etc/hosts
    127.0.0.1   localhost
    ::1         localhost
    127.0.0.1   <MY_HOSTNAME>.localdomain <MY_HOSTNAME>
passwd # type your root password
useradd -m <USERNAME> # Replace <USERNAME> with the name you want (e.g. bruno)
passwd <USERNAME>
usermod -aG wheel,audio,video,optical,storage <USERNAME>
visudo # <- uncomment # %wheel ALL=(ALL) ALL
nmcli d # <- Verify if your WiFi is connected
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <NETWORK> password <PASSWORD>

# GNOME
sudo pacman -S gnome chrome-gnome-shell gnome-software-packagekit-plugin
systemctl enable gdm
# GNOME

# PANTHEON
echo -e "\n[extra-alucryd]\nServer = https://pkgbuild.com/~alucryd/\$repo/\$arch\n" | sudo tee -a /etc/pacman.conf
paru -S --noconfirm pantheon-stable
echo "wingpanel &" >> ~/.xinitrc
echo "plank &" >> ~/.xinitrc
echo "exec gala" >> ~/.xinitrc
sudo vim /etc/lightdm/lightdm.conf # <- at [Seat:*] session, uncomment greeter-session and set io.elementary.greeter as session
gsettings set org.gnome.desktop.interface icon-theme "urutau-icons"
sudo systemctl enable lightdm
# PANTHEON

exit
exit
reboot

cd /tmp
git clone https://github.com/BrunoMartinsCorrea/dev-utils.git
./dev-util/arch-based-dev-config.sh -h
./dev-util/arch-based-config.sh
```
