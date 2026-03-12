---
title: "Contributing a Patch via GitHub"
date: 2020-04-15T13:50:25+02:00
authors:
  - jubalh
---

Several people mentioned in our MUC that they have problems contributing code to the Profanity repo on GitHub because "forking all the time is cumbersome".

Let me show you an example workflow. Since I don't think it's cumbersome at all.
I assume you have an account on [GitHub](https://github.com) and are logged in.
First thing we do is fork the repo. So go to https://github.com/profanity-im/profanity and click on "Fork".
Now you should be at your fork, in my case this is: https://github.com/jubalh/profanity/

Let's go into our developtment directory: `cd dev`

Now you clone our repo: `https://github.com/profanity-im/profanity/`

Change to the directory and check out a branch: `cd profanity; git checkout -b fix/typo-in-readme`

Add our own fork: `git remote add mine https://github.com/jubalh/profanity`

Make a change: `$EDITOR README.md`.

Commit your change: `git add README.md ; git commit`

And push the change to our forked repo: `git push mine`

In the browser go to https://github.com/jubalh/profanity again and click on "Pull Request".

Write some nice text there.

A couple of days later you want to contribute something else.

So we go to our sources: `cd dev/profanity`

Pull the latest changes from master, hopefully including our own changes in case they got merged:

`git checkout master; git pull`


And then we do the same like before. We check out a new branch, we do our commits there. We push them.
So this is the same like one wouldn't use GitHub but git in general.
The only thing that is "more work" is to go to the website and create a pull request.
The "forking" actually only happens once.

If you don't like browsers, you can use something like [hub](https://hub.github.com/).
