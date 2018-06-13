---
categories: bash
custom_css: posts.css
date: 2014-07-11 11:47:26
description: How should we use our mails
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/mails.JPG
layout: post
language: en
public: yes
title: "The way we're reading mails is wrong ! Let's go fix it"
---


Since I started to work in a company, I keep receiving more and more emails days after days… And I know I'm not the only
one.

I tried *Thunderbird*, I kept it a long while, it does the job :

* Receiving mail
* Reading them
* Display them in thread
* Replay to them

Except one big flaws, It doesn't suit my work environment. I have another window.

Under *gnome*, *e17* and almost every desktop I've been using, I created another workspace to separate mail from my text
editor or web browser : I had to adapt my working environment to my mail software.

This is unacceptable, mails are simple, software that manage email must adapt to me, not rule over me !


So I tried *Mutt*, much better, but still, if I want to let it go in a corner in order to continue downloading mail when
I'm working, I have to let an entire window, in another workspace and adapt myself the way *Mutt* works.


But wait, there are a lot of mail management software, mail fetcher or mail indexer out there, let's give a try to
those.

I configured *fecthmail*, to download my entire mailbox, then, with *notmuch*, I indexed them all, wonderful, I finally
got a command line tools for getting/retrieving and writing responses with the editor of my choice !

*BUT*, that's not fully suitable in my case…

I tagged my mails, I sorted them… *LOCALLY*, and that is not possible. It's important for me to have the exact same
information on my phone too.


And then, I realized that all I wanted, all the great features I miss, was in fact already implemented in the IMAP
protocol…

Why the hell *Thunderbird* does not display my mails tags properly ? Why is there no software to have a mailbox state
or search via IMAP `SEARCH` command ?

I look up for that on internet and find nothing. Is my request totally dump ? Am I crazy ?


In front of that huge problem of mine, I think I'm the only one complaining, but still, I have a problem with mail
management software. So, I decided to make my own, a piece of software solving my problems… and perhaps solve someone
else problems.


[Imap-CLI](http://github.com/gentux/imap-cli) aims to provide a command line interface, a python API and a REST API to
consult and manage IMAP accounts:

* Get IMAP account status (New mails, mail counting… etc…)
* Get list of mails in INBOX (or any other directory)
* Search amongst mails by tag, header, or full text search
* Read mail
* Flag mail (Read, Unread, Delete… etc…)
* Reply, Forward, Bounce mails

Hope this proof of concept will help people as it already help me :)
