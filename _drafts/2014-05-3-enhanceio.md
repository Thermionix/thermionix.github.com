---
layout: post
title: "enhanceIO"
tags: [enhanceIO, archlinux, ssd, caching]
---
{% include JB/setup %}

I've recently setup <a href="https://github.com/stec-inc/EnhanceIO">enhanceIO</a> on my [Arch HTPC Steambox](http://thermionix.tumblr.com/post/69854256212/arch-linux-steambox)

EnhanceIO uses SSDs as cache devices for traditional rotating hard disk drives to help speed up workloads on the larger slower drive.

I wrote a <a href="https://aur.archlinux.org/packages/enhanceio-dkms-git/">PKGBUILD</a> and submitted it to the Arch User Repository

The biggest advantage enhanceIO has over <a href="https://wiki.archlinux.org/index.php/Bcache">bcache</a> is that the cache is completely transparent. This allows you to quickly add and remove a cache device to a mounted disk or partition. 

It also means no separate dm mapping to the physical device, so you continue to mount and access the cached device through it's default /dev entries (and UUIDs).

After installing the manual provides instructions for use.

`man eio_cli`

I can add a cache device to a mounted, in-use partition, and remove the cache with no issues.

`eio_cli create -d /dev/sda4 -s /dev/sdb -c pool`

Statistics are available under;

`cat /proc/enhanceio/pool/stats`

`eio_cli delete -c pool`

I'll be adding some performance testing stats soon.
