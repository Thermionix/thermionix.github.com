---
layout: post
title: "Android without Google Apps"
tags: [android, gapps, cyanogenmod]
---
{% include JB/setup %}

> Google Apps are the proprietary Google-branded applications that come pre-installed with most Android devices, such as the Play Store, Gmail, Maps, etc. 

FOSS on Android has progressed enough such that Gapps are no longer a necessary evil.

[OmniROM](https://omnirom.org) is a free software operating system for smartphones and tablet computers, based on the Android mobile platform. 
It is a reaction to the recent commercialisation of ROM project CyanogenMod

### Rom Customization

	#!/bin/bash
	rom_zip="omni-4.4.4-20140903-i9300-NIGHTLY.zip" #replace with latest
	rom_device="i9300" #replace with your device
	rom_url="https://dl.omnirom.org/$rom_device/$rom_zip" 
	fdroid_apk="FDroid.apk"
	fdroid_url="https://f-droid.org/$fdroid_apk"
	mkdir -p system/app/
	wget -P system/app $fdroid_url
	wget $rom_url
	# add fdroid apk
	zip -g $rom_zip system/app/$fdroid_apk
	# remove unnecessary apps
	zip -d $rom_zip \
	system/app/Browser.apk \
	system/app/Email.apk \
	system/app/Exchange2.apk \
	system/app/QuickSearchBox.apk \
	system/app/VideoEditor.apk \
	system/app/LiveWallpapers.apk \
	system/app/MagicSmokeWallpapers.apk \
	system/app/PhaseBeam.apk \
	system/app/HoloSpiralWallpaper.apk \
	system/app/NoiseField.apk \
	system/app/Galaxy4.apk \
	system/priv-app/OmniSwitch.apk \
	system/priv-app/OneTimeInitializer.apk


### Flashing the Rom

[Installing Omni on your device](http://docs.omnirom.org/Installing_Omni_on_your_device)

To ensure gapps doesn't carry over, before flashing;

* wipe data/factory reset AND
* clear cache AND
* clear Dalvik cache AND
* format system partition

### Install F-Droid

If not using the customized rom above;

* Browser to and Install <https://f-droid.org/FDroid.apk> on your phone  
* Alternatively load from your desktop;  
`wget https://f-droid.org/FDroid.apk && adb install FDroid.apk`

### Applications

The default calendar, contacts, SMS and camera apps all work fine.

* Email: [K-9](https://f-droid.org/repository/browse/?fdfilter=k9&fdid=com.fsck.k9)
* Web browser: [Firefox](https://f-droid.org/repository/browse/?fdfilter=firefox&fdid=org.mozilla.firefox)
* Music: [Apollo](https://f-droid.org/repository/browse/?fdfilter=apollo&fdid=com.andrew.apollo)
* Maps and Navigation: [OsmAnd](https://f-droid.org/repository/browse/?fdfilter=osmand&fdid=net.osmand.plus)
* Tasks: [SimpleTask](https://f-droid.org/repository/browse/?fdfilter=simpletask&fdid=nl.mpcjanssen.simpletask)
* Filesync: [Syncthing](https://f-droid.org/repository/browse/?fdfilter=syncthing&fdid=com.nutomic.syncthingandroid)
* VOIP: [CSipSimple](https://f-droid.org/repository/browse/?fdfilter=sip&fdid=com.csipsimple)
* Group Messaging: [Telegram](https://f-droid.org/repository/browse/?fdfilter=push&fdid=org.telegram.messenger)
* Video Player: [VLC](https://f-droid.org/repository/browse/?fdfilter=vlc&fdid=org.videolan.vlc)

#### Others

* [Document Viewer](https://f-droid.org/repository/browse/?fdid=org.sufficientlysecure.viewer)
* [Barcode Scanner](https://f-droid.org/repository/browse/?fdid=com.google.zxing.client.android)
* [YouTube Downloader](https://f-droid.org/repository/browse/?fdid=dentex.youtube.downloader)
* [Wikipedia](https://f-droid.org/repository/browse/?fdid=org.wikipedia)
* [ConnectBot](https://f-droid.org/repository/browse/?fdid=org.connectbot)
* [Ghost Commander](https://f-droid.org/repository/browse/?fdid=com.ghostsq.commander)
* [RedReader Beta](https://f-droid.org/repository/browse/?fdid=org.quantumbadger.redreader)
* [SMS Backup+](https://f-droid.org/repository/browse/?fdid=com.zegoggles.smssync)
* [Call recorder](https://f-droid.org/repository/browse/?fdid=com.call.recorder)
* [Plumble](https://f-droid.org/repository/browse/?fdid=com.morlunk.mumbleclient)

### Apks from GPlay

There's still a few niche apps that aren't available from fdroid that I would like to use.

I currently side-load apks from <http://apps.evozi.com/apk-downloader/>

### Add GuardianProject Fdroid Repo

1. Within Fdroid go to Menu > Manage Repos > New Repository
2. Enter: https://guardianproject.info/repo
3. Return to the main screen, and Menu > Update
4. Verify the repo fingerprint by clicking on the repo to see the repo details view. The fingerprint you see there should match this: 59050C8155DCA377F23D5A15B77D3713400CDBD8B42FBFBE0E3F38096E68CECE. 

