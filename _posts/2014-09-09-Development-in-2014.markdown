---
categories: development
custom_css: posts.css
date: 2014-09-09 15:31:55
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/architectTools.jpeg
layout: post
title: "Software development in 2014"
---


At work, we have a lot of project. Different part of many solutions developed for many customers. As an example,
Comarquage, a solution I have to maintain contains following sub-projects :

* Biryani
* Cosmetic
* Etalage
* Petitpois
* Territoria
* Some internal libraries
* … etc…

You can find sources of those project and other [here](https://gitorious.org/infos-pratiques).


## Problem ##

Those projects share lots of internal element, dependencies through each others and third party python libraries.

Moreover, we have some dependencies I'll call "vicious dependencies", like our
[CDN](https://en.wikipedia.org/wiki/Content_delivery_network). You can easily change CDN in configuration
files, but other CDN won't have the same structure as ours… that's how our CDN became a dependency in those project.


Nobody here at work seems to worry about those. Lead developers left the company and I find myself alone against all
that code.

The problem lies in **I'm the only one who can actually work on these project**. No one can know where are dependencies,
where are all **git** repositories, where are **prod** and **preprod** servers for all services. I am the only one who
can install and run the **Comarquage** solution.


## Solution ##

So I began a campaign through my company to put in place a few set of default behaviour all developers should have ! And
I'll adapt those software I have to maintain as examples.


### README ###

First of all, lot of old project doesn't have a **README** file, this is the most important file on a project, you have
to write it and keep it up to date.

It **must** contains at least :

* Description : What is this project, Why developing it ?
* Quickstart / Installation : What should I do to begin development
* Author
* How to contribute 

Those are a minimal requirement so any developer can find his mark fast and begin the work.


### Dependencies list ###

The quickstart section in the **README** impose this point. A project has to be simple to install.

* Sys/Admin will be happy… almost
* Other developer can install dependencies faster and work faster


### Minimal test suite ###

OK, you are an old and grumpy dev and you don't want to write tests. I can understand… in fact, I don't, whatever.

But please ! Write a minimal setup script, something we can run to tell if the project run or not.


## Conclusion ##

Those elements are not enough in my opinion. A real project should have :

* His documentation up to date
* Unit test to avoid regression
* User documentation… just telling what the project is designed for in a few line

I'm not asking to stop working and write poetry, just asking to do the job well enough to allow contribution.
