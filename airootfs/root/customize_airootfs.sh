#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service ufw.service NetworkManager.service dnscrypt-proxy.socket
systemctl set-default multi-user.target

### CUSTOMIZATIONS
ufw default deny incoming
sed -i '/icmp/s/ACCEPT/DROP/' /etc/ufw/before.rules
sed -i '/icmp/s/ACCEPT/DROP/' /etc/ufw/before6.rules

## create sudo group
if [[ -z $(grep sudo /etc/group) ]]; then
	groupadd sudo
fi

## create user "arch" and add to useful groups (esp. sudo since we locked root above)
## sets default password to "live"
! id arch && useradd -m -p '$6$Q8xieUdz1yfagtkx$/XI9UB6VFk4KTDP9FSk62ftN6UhBfa0BQl3m4uKpC5w0pNj7TMNgrnLlMM1nrfkjTxi7rbXGmsojIP0.tr.MQ0' -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel,sudo" -s /usr/bin/zsh arch
## copy skel files to new home
cp -aT /etc/skel/ /home/arch/
chown -R arch: /home/arch/

## uncomment %sudo group in sudoers file to give permission
sed -i '/%sudo/s/^#//' /etc/sudoers
