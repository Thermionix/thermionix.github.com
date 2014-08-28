---
layout: post
title: "Arch Linux Steambox"
tags: [archlinux, steamos, steambox, htpc, xbmc]
---
{% include JB/setup %}

I've recently setup ArchLinux on the HTPC, and set it to boot into XBMC standalone. From XBMC there's a shortcut to close <a href="https://aur.archlinux.org/packages/xbmc-addon-steam-launcher/">XBMC and launch steam</a>. Of course one could easily boot <a href="https://aur.archlinux.org/packages/steam-standalone/">straight into steam</a> giving functionality similar to steamOS.

I have a script I use to help me <a href="https://github.com/Thermionix/arch-scripts/blob/master/arch-install.sh">quickly perform a new Arch base install</a>

After the base install, I reboot and call another script to <a href="https://github.com/Thermionix/arch-scripts/blob/master/steambox-post.sh">setup the environment</a>

A snippet of that script;

<script src="http://gist-it.sudarmuthu.com/http://github.com/Thermionix/arch-scripts/raw/master/steambox-post.sh?footer=minimal&slice=30:60"></script>

If you already have Arch installed an want to boot straight into Steam Bigpicture;

`pacaur -S steam-standalone`

`sudo systemctl enable steam-standalone.service`

### Experiences

The hardware I'm currently running it on;

 *   Intel i3-3225 Processor (3M Cache, 3.30 GHz) with HD4000
 *   Asus P8H77-M
 *   8gb DDR3
 *   Silverstone Grandia GD05
 *   WD 1TB
 *   Crucial 64GB SSD
 *   Silverstone Modular 600w
 *   Asus Sata Dvd Writer
 *   Logitech K400r wireless touchpad keyboard
 *   Xbox 360 Wireless Controllers (four of)

I'm also playing around with using <a href="http://thermionix.tumblr.com/post/70240002135/enhanceio/">enhanceIO to speed up</a> the 1tb storage drive by caching data on an ssd.

Graphics performance at the moment seems marginal, the TV resolution is 1920x1080 and the HD4000 definitely struggles on AAA titles. I'll soon be adding discrete graphics. Although I've been quite impressed with how the HD4000 is handling <a href="http://store.steampowered.com/app/249990/">Forced</a>

All the xbox 360 wireless controllers are working perfectly with the kernel xpad module (after fixing permissions for SDL with a udev rule - included in the <a href="https://aur.archlinux.org/packages/steam-standalone/">steam-standalone</a> pkg)

Even though [SteamOS](http://store.steampowered.com/livingroom/SteamOS/) has been released I'll definitely be sticking with Arch Linux; [systemd](https://wiki.archlinux.org/index.php/systemd) is brilliant, I have a super fast boot (under 5s cold into xbmc), ease of modification (I'm planning on integrating retroplayer to play roms) and I'm easily able to target the absolute latest kernel and graphics drivers.

I'm also running a <a href="http://www.ji.com.au/products/pt9778/">power saving board</a> and a remote power switch hooked into the HTPC, which means one press, the pc boots and powers on the TV+Amp+Sub. Poweroff and everything turns off after pc has safely powered off.

![](https://31.media.tumblr.com/ec8bb36a0c5aa227c459846e63a8a604/tumblr_inline_mxxgtifSkf1subtc5.png)
![](https://31.media.tumblr.com/241c43f069f42c5d657fb5d186ea672a/tumblr_inline_mxxfynzb7E1subtc5.png)
![](https://31.media.tumblr.com/fa80d94de25a21650d5d6f14df152b7e/tumblr_inline_mxxg449H7O1subtc5.jpg)
