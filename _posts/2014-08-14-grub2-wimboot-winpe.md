---
layout: post
title: "grub2 wimboot winPE"
description: ""
category: 
tags: [grub2, wimboot, winpe]
---
{% include JB/setup %}

I've recently added support for booting WinPE images to my [grub2 multipass usbkey](https://github.com/Thermionix/multipass-usb)

Using [wimboot](http://ipxe.org/wimboot) I can loopback Microsoft Diagnostics and Recovery Toolset (DaRT) iso files and boot them directly off the usbkey

	# Loopback and boot DaRT 8.1 ISO
	menuentry "wimboot DaRT-8.1-Win-x64-6.3.9600.iso" {
		set iso_path="/bootisos/DaRT-8.1-Win-x64-6.3.9600.iso"
		loopback loop $iso_path
		linux16 /boot/grub/wimboot
		initrd16 \
			newc:bootmgr:(loop)/bootmgr \
			newc:bcd:(loop)/Boot/BCD \
			newc:segmono_boot.ttf:$wim_root/Boot/Fonts/segmono_boot.ttf \
			newc:segoe_slboot.ttf:$wim_root/Boot/Fonts/segoe_slboot.ttf \
			newc:segoen_slboot.ttf:$wim_root/Boot/Fonts/segoen_slboot.ttf \
			newc:wgl4_boot.ttf:$wim_root/Boot/Fonts/wgl4_boot.ttf \
			newc:boot.sdi:(loop)/Boot/boot.sdi \
			newc:boot.wim:(loop)/sources/boot.wim
	}

	# Loopback and boot DaRT 7.0 ISO
	menuentry "wimboot DaRT70-x64.iso" {
		set iso_path="/bootisos/DaRT70-x64.iso"
		loopback loop $iso_path
		linux16 /boot/grub/wimboot
		initrd16 \
			newc:bootmgr:(loop)/bootmgr \
			newc:bcd:(loop)/boot/bcd \
			newc:boot.sdi:(loop)/boot/boot.sdi \
			newc:boot.wim:(loop)/sources/boot.wim
	}


wimboot allows Windows to reuse the memory that was used to hold the RAM disk image; there is no wasted memory.

The call I make in create.grub.key.sh to append it to my keys;

`wget -qO- http://git.ipxe.org/releases/wimboot/wimboot-latest.zip | bsdtar --include wimboot-*/wimboot --strip-components 1 -C ./boot/grub -xvf-`
