

---

# Arch basic install

---

This is my repo for the *basic Arch install* that I keep handy because installing Arch everytime can be a drag as my system tends to break quite often and I also like to try out various DEs and WMs.

So just clone this repo, make a few necessary changes to the username and passwords or **comment out** any packages you don't need and there you have a fresh Arch install without going through the pain of typing commands for an hour or so.

A small summary:

1. If needed, load your keymap
2. Refresh the servers with ``pacman -Syy``
3. Partition the disk using cfdisk or whatever tool suits you
4. Format the partitions using `mkfs` command
   
   example: `mkfs.ext4 /dev/sda1`
5. Mount the partitions using `mount` command
   
   example: `mount /dev/sda2 /mnt/boot/efi` 
6. Install the base packages into /mnt using ``pacstrap /mnt base linux linux-firmware git vim intel-ucode`` (or ``amd-ucode``))
7. Generate the FSTAB file with ```genfstab -U /mnt >> /mnt/etc/fstab```
8. Chroot in with ```arch-chroot /mnt```
9. Download the git repository with ```git clone --depth=1 https://github.com/PSxUchiha/arch-basic-install```
10. ```cd arch-basic-install```
11. ```chmod +x arch-install-basic.sh```
12. run with ```./arch-install-basic.sh```
