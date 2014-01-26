---
layout: post
title: "Make a NAS with Rasberry Pi"
date: 2014-01-19 18:42:32
categories: services life storage
---


The first step in making my own space on Internet with RPi is storage.

Nothing is possible without data storage, I need :

* Backup (mail, configurations…)
* Public Data (Shared links, shared photos… ect…)
* Private Documents for users (and myself)

And the SD Card is not enough to store all that (in addition of that fact, I won't store backups on the same drive as
the backuped system)

I thought RPi was the right way to make all of this. I plugged in a 2To external HardDrive with its own power supply and
began to backup configurations files and every home directory.

RPi works very well with backup and private documents, but problems appear when you need to share big files. My USB
drive froze every minutes for a few second.

As for today, I haven't found any viable solution to use RPi as the center of my world at home. Everything works fine
appart sharing hard drives.

The solution I use today consist of sharing disks via my routeur (which provide samba sharing for external drives).
