---
layout: post
title: "Soufflet.IO services"
date: 2014-12-15 15:46:42
categories: tools personal cloud
---

It's been 3 weeks since I acquired the **Firefox OS Flame** device. I finally
have a working smartphone were I can read mails, calendar events, access a real
browser… etc…

I am very proud to use only services I manage myself : no Google, no other
companies services or piece of hardware, just me and my
[**RaspberryPI**](http://www.raspberrypi.org/) (RPi for short).


My services are working for about a year now, my brother use it, my parents use
it and I think it stable enough for me to speak a little about it.


## Hardware

First of all, the hardware part.

* What resources do I need ?
* What about the bandwith ?
* Backups ?

So, as I did not had any clue for these question, I used a simple RPi at home. I
got fiber installed a few days after that and did not need to bother about
bandwith anymore.

The main problem behind a RPi is resources. My first try to have a set of
personal services was [**Owncloud**](http://owncloud.org/), performances were very bad.

Then, I tried [**cozycloud**](http://cozy.io/) but no more success with it.


I decided to install all services I wanted one by one:

* Postfix / Dovecot for mails
* [Radicale](http://radicale.org/) for CalDav and CardDav
* Apache moddav for remote storage
* Vsftpd for FTP
* OpenVPN


## SSL Certificates


All those services run on one single RPi.

And I use them with the Desktop at home, my laptop at work and my phone anywhere
else.

On first version I installed this year, I used some self-signed certificates.
It's perfectly fine to use those, but when I got my **FirefoxOS** device, those
certifiacates were rejected.

The solution is named [**StartSSL**](https://www.startssl.com/) : on this
website, you can create **free** SSL certificates and they're valid in most of
modern browser.

**FirefoxOS** accept these certificate without any issues. So, big thank to
**StartSSL** team !


## Users setup


Installing those services is not very difficult. You have to spend some time to
understand their configuration, to make something clean, something that works.
But you can handle it.

The challenge that comes next is your users. In my case, family members.


They are ruthless ! They can't imagine how difficult it is to find free and
opensource solution for these services. Google's services run so well that my
family does not really understand problems behind.


So I had to make something really sure and relyable before letting them use it.


Moreover, I had to configure their devices myself. That's the most painful
point. But then, they're realy happy and proud to see that all is working well.


## Backups

That's the last point.

When it's not working, you do not need to setup your backup. But when you begin
to have users, it become important.


For now, I use a CRON job to export data into my laptop. And once a week, the
RPi at my parents' house fetch data to have an external backup.


## Conclusion

25$ for RPi, 20$ for cable and a few hours to lose and you got your personal
services, free and open source based.

I am proud of what I've done here, it does exactly what I intended to :

* It's cheap
* Relyable
* Standard user can rely on it


So I invite anyone interrested on this subject to write me a mail if they need
assistance.
