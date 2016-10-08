---
layout: post
categories: life firefoxos
date: 2014-05-02 10:25:54
title: "Upgrade Geeksphone Peak to nightly build"
img: img/hd/firefoxOS.jpg
---


About a year ago, I left my Nokia N900 phone to buy a Geeksphone device (
[Peak](http://www.geeksphone.com/other-devices-2/) ). This was hard, very hard… and it still is.

The phone I bought was a developper preview device, I couldn't import contacts from my old device, I couldn't check my
personal calendars through it… But still, I wanted to be part of the FirefoxOS adventure.


Last stable update from Geeksphone was received on November 2013 and this situation began to really bothered me. Every
bugs I experienced were solved and my apps weren't updated either. Sometime I could even find nice apps wich were not
compatible with my version of FirefoxOS.

So I put me fears aside and stepped into the flashing process to get a nightly build installed on my peak. Every step is
simple, but if it goes wrong, I could lost all my contacts… Wich I entered by hand…

You can read the original version of these steps
[here](http://downloads.geeksphone.com/drivers/Manual_flash_geeksphone-eng.txt).

First and Second steps are simple verification, have at least 50% of battery remaining and activate Remote debugging on
the phone (go to Settings, Device Information, More Information, Developer and check on Remote Debugging).

Third step is for windows users only. Didn't need it on my Debian.

You will then have to download a FirefoxOS image build for your phone. You can found those build in
[Geeksphone download pages](http://downloads.geeksphone.com/). You can safely unzip it afterwards.

But wait a minute before running sixth step. You can found some piece of information out there, but nobody could clearly
tell me if my data will be or won't be lost.

First thing first, on Debian system, you'll have to installed those package to run though next step :

* android-tools-adb
* android-tools-flashboot

Then, you will have to run *adb* as root. So plug your phone with USB cable and run :

    # adb devices

It will start **adb** deamon and now can read throught your phone. You can then follow instruction to backup some data
[here](http://firefoxosguide.com/firefox-os/how-to-backup-contacts-on-firefox-os-device-step-by-step-tutorial.html/) (I
didn't need those)

If all goes well till now, you can safely do the last part. But I couldn't run the flash.sh script given by Geeksphone
because it don't use **adb** and **flashboot** installed on my system.

So I edited the *flash.sh* script :

    #!/bin/bash
    adb reboot bootloader
    fastboot flash boot boot.img
    echo "Do you want to keep your user data ? (Some users has problems in first reboot, if you have, please reflash and select not to keep the data)"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) break;;
            No ) ./fastboot flash userdata userdata.img; break;;
        esac
    done
    fastboot flash system system.img
    fastboot flash recovery recovery.img
    fastboot erase cache
    fastboot reboot

Wait until your phone reboot and that's it, you have the latest version of FirefoxOS :)

I'm using it every day and I really see how much progress FirefoxOS have made the last few month. To go further, I will
rtry to build my own image of this OS and maybe I will have time to fix some bugs ;)
