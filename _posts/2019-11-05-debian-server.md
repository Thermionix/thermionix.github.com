---
layout: post
title: "Debian Server w/ Docker & ZFS"
tags: [debian, server, zfs, docker]
---
{% include JB/setup %}

### Minimal Install
Using <a href="https://cdimage.debian.org/mirror/cdimage/release/current/amd64/iso-cd/debian-10.2.0-amd64-netinst.iso">debian-10.2.0-amd64-netinst.iso</a>
 * Proceed through installation
 * Use `Guided - use entire disk` on the ssd OS disk
 * Software selection - Check only `SSH server`
 * Complete setup and reboot

### SSH Access

Login to the machine with your user credentials to get the IP address

	ip a | grep global

SSH via a machine on the same network with resultant ip

	ssh username@192.168....


If you wish to use SSH Keys to access the server <a href="https://wiki.archlinux.org/index.php/SSH_keys#Generating_an_SSH_key_pair">read about ssh-key generation</a> 
<br>You can copy local keys from your desktop to the remote machine with;

	ssh-copy-id 192.168.1...

### Sudo

setup <a href="https://wiki.debian.org/sudo">sudo</a> and add your user to sudoers group

	su -c "apt-get -y install sudo && /usr/sbin/adduser `whoami` sudo"

	#reload groups without logging out
	exec su -l $USER

	#test sudo by disabling root user login
	sudo passwd -l root

	sudo apt-get -y install nano tmux rsync bash-completion

### Static IP Address

configure <a href="https://wiki.debian.org/NetworkConfiguration">a static ip address</a>
<br><b>PLEASE ADJUST</b> interface name & IP addresses

	cat <<-'EOF' | sudo tee /etc/network/interfaces
	auto lo
	iface lo inet loopback
	
	auto enp0s3
	iface enp0s3 inet static
	address 192.168.1.50/24
	gateway 192.168.1.1
	EOF

	echo "nameserver 192.168.1.1" | sudo tee /etc/resolv.conf

	sudo systemctl restart networking

and SSH back in on new IP

### ZFS

via <a href="https://wiki.debian.org/ZFS">debian wiki</a> enable backports

	echo -e "\n# Backports repository \
	\ndeb http://deb.debian.org/debian buster-backports main contrib non-free \
	\ndeb-src http://deb.debian.org/debian buster-backports main contrib non-free" \
	| sudo tee --append /etc/apt/sources.list

	sudo apt update && sudo apt install linux-headers-`uname -r`

	sudo apt install -t buster-backports dkms spl-dkms zfs-dkms zfsutils-linux

	sudo modprobe zfs

	sudo systemctl disable zfs-share

I'm importing and existing pool, please read the documentation on pool creation.

### Docker

via <a href="https://docs.docker.com/install/linux/docker-ce/debian/">docker install documentation</a> add repo and install

	sudo apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
	sudo apt-get update
	sudo apt-get -y install docker-ce docker-ce-cli containerd.io



