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

<script src="http://gist-it.sudarmuthu.com/http://github.com/Thermionix/arch-scripts/raw/master/steambox-post.sh?footer=minimal&slice=205:247"></script>

If you already have Arch installed an want to boot straight into Steam Bigpicture;

`pacaur -S steam-standalone`

`sudo systemctl enable steam-standalone.service`

### Experiences

The hardware I'm currently running it on;

 *   Intel® NUC DN2820FYKH
 *   4gb DDR3 SODIMM
 *   Samsung 120GB SSD
 *   Logitech K400r wireless touchpad keyboard
 *   Xbox 360 Wireless Controllers (four of)

All the xbox 360 wireless controllers are working perfectly with the kernel xpad module (after fixing permissions for SDL with a udev rule - included in the <a href="https://aur.archlinux.org/packages/steam-standalone/">steam-standalone</a> pkg)

Even though [SteamOS](http://store.steampowered.com/livingroom/SteamOS/) has been released I'll definitely be sticking with Arch Linux; [systemd](https://wiki.archlinux.org/index.php/systemd) is brilliant, I have a super fast boot (under 5s cold into xbmc), ease of modification (I'm planning on integrating retroplayer to play roms) and I'm easily able to target the absolute latest kernel and graphics drivers.

I'm also running a <a href="http://www.bunnings.com.au/hpm-6-outlet-powerboard-with-energy-meter_p4420231/">power saving board</a>, a push of the remote power's on the TV+Amp+Sub. Poweroff and everything turns off after pc has safely powered off.

Note: The above power-board needed to be adjusted down to detect the on-draw current of the NUC @ ~7w (most of these boards switch at about 20w)

![](/assets/mxxgtifSkf1subtc5.png)
![](/assets/mxxfynzb7E1subtc5.png)
![](/assets/mxxg449H7O1subtc5.jpg)
