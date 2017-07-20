---
layout: post
title: "Discovering GO"
date: 2015-06-18 09:46:42
categories: language work
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/Golang.jpg
custom_css: posts.css
---

Since I began to work a [**CloudWatt**](http://www.cloudwatt.com/), I've been
quite busy and I didn't wrote a thing. Today, this will change, I have learned
so much in 6 month, I **HAVE** to share !

**CloudWatt** is a *public cloud provider*. behind this words, it's a instance
of [**openstack**](http://www.openstack.org) delivering virtual private servers
for its customers.

I've learned a lot and today I'll talk about my journey with the GO programming
language.


## My first project in GO

There's two main reason for me to learn more about GO. The first one is the fact
that some people, friends and colleague talk about this language regularly. and
the second one, some project I like are written in GO.

Project like [**wego**](https://github.com/schachmat/wego) of
[**Goaccess**](https://github.com/allinurl/goaccess) are written in GO and save
me everyday.

I decided to start my own project, and created
[**friend-bots**](https://github.com/Gentux/friend-bots).

Through this simple exercice I can explore some of the language basic feature:

* Basic syntax
* Compilers
* Source code linter
* Packaging
* Libraries
* Community surrounding the language
* … etc…

## Result

Let's take a tour with me.

I'll start with a negative point, its basic syntax. It may be confusing at first
and I find it less readable than **Python**. It's not a big issue because we can
write correctly and produce readable code anyway (I had to mention this).

But then, all the good parts. First, let me talk about the "default" command
line client for **GO**. This command line is a wrapper, like **GIT** and it
allow the users to launch several tools.

With this single entry point, the command **go** gives you :

* The linter, it will format your code properly
* The compiler to build a valid executable file
* The packaging manager to download and manage external libraries
* It run your tests !
* This command also let you run your code (a build and run shortcut)

And I didn't to learn or do some crazy stuff to have all of that working, the
most difficult part was to set up the **GOPATH** environement variable and modify
**PATH**.

Afterward, I can speak about libraries and packaging. **GO** can handle several
versioning system like **GIT**, you just have to name your library and give a
URL where your system can fetch the specified library :


```
import irc "github.com/fluffle/goirc/client"
```

You can note here, I'm importing a module called **goirc** and naming it
**irc**.

But, I had to mention it too, there's one issue with this. A few days ago, a
library migrated from *code.google.com* to *github.com*. So **travis** could not
built my project anymore as he couldn't retrieve sources.

I made a pull request to **fluffle** and change the import line as below.

```
import irc "github.com/gentux/goirc/client"
```

This story is a bad point for me, we are using internet resources for internal
code, and it might break anytime.


## Conclusion

I could talk more about GO, but I really think you should give it a try if you
want to learn more :)

This is a great tool for every small components you might need. You can build an
executable file for every platform and deploy it very fast.

Bye, and happy hacking !
