printf "##\n## Arch Linux repository mirrorlist\n## Generated on 2021-07-09\n##\n\n## India\nServer = http://mirror.cse.iitk.ac.in/archlinux/$repo/os/$arch\nServer = http://mirrors.piconets.webwerks.in/archlinux-mirror/$repo/os/$arch\nServer = https://mirrors.piconets.webwerks.in/archlinux-mirror/$repo/os/$arch" >> /mnt/etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware nano vim 
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
mkinitcpio -P
echo root:*replace* | chpasswd
pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable avahi-daemon
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m priyanshu
echo priyanshu:*change* | chpasswd
usermod -aG libvirt priyanshu

echo "priyanshu ALL=(ALL) ALL" >> /etc/sudoers.d/priyanshu


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"


