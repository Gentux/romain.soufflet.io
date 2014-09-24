---
layout: post
title: "Creating a Debian package from a distutil python project"
date: 2014-09-20 13:33:42
categories: python debian packaging
---

I've been working for a few month now on a new IMAP librariry. It's working, I can use it almost every day for checking
and managing my mails and that's great !

I'd like to communicate arround my project, get some users, advice and bug reports. But I think it's too early for that.
If I want to communicate, I'll tell the world to try the library and normal people don't really want to use **git** to
checkout the repos and install manually.

So I decided to make a Debian package.

First of all, I have to read those:

* [Debian Python Policies](http://www.debian.org/doc/packaging-manuals/python-policy/index.html#contents)
* [Style Guide for Packaging Python Libraries](https://wiki.debian.org/Python/LibraryStyleGuide)

It's important, you can't upload a package into Debian without reading those guidelines. And once you get the minimum
knowledge about how packaging work you can read about automatic building tools:

* [Pybuild](https://wiki.debian.org/Python/Pybuild)
* [python-stdeb](https://pypi.python.org/pypi/stdeb)

But those informations sources are big, and boring, so here a quickstart to packaging a python project :)


## Stdeb

Projet [stdeb](https://pypi.python.org/pypi/stdeb) is a third party tools aiming to ease **.deb** packaging. It
takes a **tarball** of any python projet uploadable on **pypi** and process every meta information available in it to
produce Debian source packages.

This is a really good starting point, but you surely won't be satisfied by the result. For example, in Imap-CLI, there
is a CHANGELOG file, but when stdeb parse the project, it doesn't use it, so **debian changelog** will be empty with
just an "Initial release" section.

Read carefully all files in **debian** directory, every information you'll have to modify or add or erase in those files
are stored elsewhere in your project, mostly in your **setup.py**.


## Getting a .deb archive

Once 


## Uploading
