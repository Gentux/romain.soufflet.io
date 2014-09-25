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
knowledge about how packaging works you can read about automatic building tools:

* [Pybuild](https://wiki.debian.org/Python/Pybuild)
* [python-stdeb](https://pypi.python.org/pypi/stdeb)

But those informations sources are big, and boring, so here a quickstart to packaging a python project :)


## Stdeb ##

Projet [stdeb](https://pypi.python.org/pypi/stdeb) is a third party tools aiming to ease **.deb** packaging. It
takes a **tarball** of any python projet uploadable on **pypi** and process every meta information available in it to
produce Debian source packages.

    $ python setup.py sdist
    $ py2dsc dist/My-Package-X.Y.tar.gz

What you get is a new directory **deb_dist** containing:

* A **My-Package-X.Y** directory containing all needed file
* Debian packages files in tar.xz format
* A [**DSC**](https://wiki.debian.org/dsc) file
* A file describing source changes
* The original tar.gz file

This is a really good starting point, but you surely won't be satisfied by the result. For example, in Imap-CLI, there
is a CHANGELOG file, but when stdeb parse the project, it doesn't use it, so **debian changelog** will be empty with
just an "Initial release" section.

Read carefully all files in **debian** directory, every information you'll have to modify or add or erase in those files
are stored elsewhere in your project, mostly in your **setup.py**.


## Creating the Package ##

Once the **debian** dir is correctly created with correct informations, the next step is creating the **.deb** file. For
that, you can erase **dist** and **deb_dist** directories, and in place of previous command:

    $ python setup.py sdist
    $ py2dsc-deb dist/My-Package-X.Y.tar.gz

The process is similar except it includes few more step and create the holy **.deb** file. But we're not finished here.


## Lintian ##

You have your *.deb* file, now, it's time to ensure it's a good deb archive. For that, you can use **lintian**, it'll
point out every defect in the archive according to debian policies (cause I assume you haven't read all of those !)

You can find helpfull information on **lintian** [here](https://lintian.debian.org/manual/index.html)
