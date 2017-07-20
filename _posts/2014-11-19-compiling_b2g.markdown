---
categories: FirefoxOS debian docker
custom_css: posts.css
date: 2014-11-19 19:32:42
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/firefoxOS.jpg
layout: post
title: "Compiling «Boot 2 Gecko» on Debian"
---

I wrote about my [Peak](http://www.geeksphone.com/other-devices-2/) phone a while ago. It's time to write again on
FirefoxOS !


Using the geeksphone peak is a pain. Got lots of bug, my battery last for a few hours when I use it and it became very
slow.<br>
But I discovered the [flame device](https://developer.mozilla.org/en-US/Firefox_OS/Developer_phone_guide/Flame) and my
doubt about FirefoxOS disapeared !<br>
The device itself is beautiful, heavy as it should (in my opinions) and it works.<br>
The only issues I got is about compiling my own image of FirefoxOS (cause I like to have my own). So I'll explain how I
did it here.


Why is there an issue ? In fact, I don't really know, I didn't dug into to find out, build scripts are asking for a
particular version of **gcc**, a particular version of **GNU make**… etc…<br>
I had the idea of using a Docker container to install those dependancies, but it's already
[there](https://github.com/simonjohansson/B2G-build)


Just keep in mind before reading the README in this repository that you'll need at least **20GB** of free space on your
disk in order to download all git repositories.<br>
You can also find usefull information and scripts in this repositories:

    https://github.com/Mozilla-TWQA/B2G-flash-tool.git


Happy Hacking :D
