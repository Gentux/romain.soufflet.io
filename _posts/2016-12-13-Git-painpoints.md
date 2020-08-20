---
categories: services life
custom_css: posts.css
date: 2016-11-09 18:42:32
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/mastering-git-small.jpeg
layout: post
toporder: 11
language: en
public: yes
title: "Mastering GIT by reducing the pain"
---

Using **GIT** every day is quite normal for a developer. We work with **GIT**,
we trust it to keep our files safe and we trust it to share them too. A long
time ago, when I was on my first internship at
[**Easter-eggs**](https://easter-eggs.com/) I wrote a small web service to
automate a customer's **GIT** workflow.

I learned a lot about **GIT** at that time. Not only the command line interface,
but also some internals and structures. Since then, I love it, and I use it
every time I deal with text files… well, I'm always dealing with text files, so
I'm **ALWAYS** dealing with **GIT**.

But, even if I'm loving it, I have to say : **GIT** is also painful:

* You have a long list of command to type to do what you want to do
* Lots of repetition through a single day developing in a team
* Through repetition, us, poor human beings, make mistakes
* More command to revert those errors
* More command to complete the task you wanted to de before you made those
  errors
* More error due to more commands…

![take a sip](https://www.gizmodo.in/photo/47475817.cms)

It's difficult to make **GIT** act the way you want, you have to learn a lot for
that. I saw a lot of programmer who actually adopted a *simpler approach*

```
cd ..
mv my-repo my-repo.bak
git clone <url-of-my-repo>
```

![this is horrible](https://media.giphy.com/media/t3iWR3dkTsW9q/giphy.gif)

So let's try to learn some ways to do better, some ways to master your
repository and not going crazy about it.

## Stash and Discard

First painpoints in your workflow will happen locally, on your machine. You'll
have to organize your commits before pushing them to the team. Let's avoid some
dangerous shortcut. Never commit everything in your directory, carefully select
your changes and put a clean and clear commit message to help people understand
your patch.

Once you got clear commits, and are ready to push, or rebase on remote branches,
you'll often find yourself in a situation were you have some more changes that
you can't send. It may be configurations, debug logging instruction, or even
some code commented out during your work. This files and changes will prevent
**GIT** from performing further operation including merges and rebases.

So, let's use the most important script to me: **git-stash**. It'll let you save
your working tree in a separate commit, not in your current branch. You can then
do whatever you want on a clean working tree without worying of all the little
changes you might want to keep. Nobody will ever notice your stash.

You just have to *apply* your stash once you finish manipulating your repository
and you're good to go.

But wait, this isn't magic and you'll have to deal with possible conflict
between your stashed changes and your local files. I often find myself in a
situation were I got multiple stash on my repos, and I can't remember what's in
it.

There is no solution right now to deal with this with a simple installation of
**GIT**. You can find some addons to help you, but in my opinions, best ways to
avoid possible issues is to apply simple rules to keep a sane repository:

* Configuration files in **.gitignore** file. You don't want to commit
  configuration variables (sometimes contains credentials)
* If you add local files and can't commit them even in **.gitignore**, put them
  in a **ignored** directory referenced in **.gitignore**
* Force yourself to always work on a clear and updated repository. Rebase often
  on team's work.
* Communicate with your team ! Share your solutions, there's pretty good chances
  your coworkers have the same issues !

Then, logically, when you want to commit and push your work, you quickly take
habits with stash. You multiply commands on your terminal and end up with some
aliases or meta-command to help you.

## Repository, remotes and branches

Another complexity that often occurs is implied by remotes and branches. You
don't work alone, and you need to use your coworkers' work. It's easy to lose
grip.

Switching repositories, remotes and branches is hard, don't count on your
memory, it sucks at remembering things correctly… humans…

The simplest solution is the same as everyone does with their code:
**conventions** also known as **Branching models**. Except here, all companies
have different ways to do that, and you often find in a single team several ways
of doing things.

### First solution : A single repository

Simpler solution is to remove complexity through a single repository. You avoid
this particular issue and some team may like it.

The main advantage of this approach is your commits, they are bigger, but
contains everything you need and you can add or remove thing by editing single
commits.

I personally discourage this as it won't scale with whatever your team do next.

If your company grows, chances are that your repos will grow too. You add teams
on some other project and everything inside your repository. Rebasing always and
always on a repos that admit so much changes will be harassing.

### Second solution : Hooks

You can also forbid any human to do thing and automate your team workflow with
**git hooks**. This will automate some task, like submitting a pull request or
cleaning up the project. You can automate your tests with the commange *git
commit* to ensure your commit has run your tests.

You can basically add anything you want to your workflow automatically with
*hooks*.

Your team will perform good operations, but they won't understand them. Worse,
they won't be able to detect when it goes wrong. Write your **hooks** in
**bash** and there's pretty good chances that some of your users will fail
executing them.

So, **git-hooks** might be a good thing, but check the following before telling
everyone to use it :

* Everyone have to be able to execute your scripts
* Everyone must understand what it does

### Third solution, the hardest : Learning

By far, learning **GIT** is the better solution to all your problems. If your
team understand how **GIT** works, there won't be any trouble using it. You'll
eventually find people doing complex things in unexpeted way.

This might sounds obvious, but it isn't. I've seen team where everyone know how
to use **GIT** but no one ever used it the same way before. Team members were
all so sure to understand what they were doing that nobody listen to other team
member.

This is the best advice I could ever make here: Take the time teach every person
in your team. It will take some weeks, or month to have ervyone on the same
page, but it worth it !

## Conclusion

So, yes, **GIT** is awesome and everyone is using it. But it's also a complex
tools, it will hurts your feelings. You can make mistake, you can loose time.

There won't be any magic tool to do things you want right away. All we can do is
a bunch of script and conventions that suits you and your team.

The way we're using **GIT** tells us more about how we organise ourselve than
the work we do. And the greatest tool you can imagine to be more productive with
**GIT** as a team is learning.

Don't hesitate to communicate on tools, tips or any conventions you saw on other
teams: lots of developper are seeking help with **GIT** and every plugins could
save their day.
