---
categories: bash
custom_css: posts.css
date: 2014-06-11 17:36:21
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/worktools.jpg
layout: post
title: "Jump between often used directories"
---

When I'm showing code or asking for advice to a colleague, I'm always surprised by their reactions when they see my
*jump* function.

I am not a huge fan of aliases, but the few ones I use are really priceless. And amongst them, my favourites is still
*jump*.

Jump is a little collection of functions in my bashrc file allowing me to mark projects folder and jump to them from
anywhere. For example :

    $ cd ~/projects/client-dir/project-dir
    $ mark
    /* … */
    $ cd ~/projects/another-client-dir/project2-dir
    /* … */
    $ jump project-dir
    $ pwd
    /home/gentux/projects/client-dir/project-dir

Jump is not alone here, functions include :

* mark      (create a new symlink)
* marks     (list symlinks)
* unmark    (remove mark)
* jump      (jump to mark)

All people I told about these little functions asked me to send them by mail, so, today I decided to create a 
[new github repository](https://github.com/Gentux/jump) to store it.

I can't recall where I originally found those functions, I've been using them for a pretty long time now and I hope it'll
be useful to other people now :)
