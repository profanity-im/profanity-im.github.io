---    
title: "How to get a backtrace"    
date: 2020-01-26T17:16:59+02:00    
authors:    
  - mdosch
---    

When you're running profanity master it may occur that profanity crashes
with SIGSEGV or SIGABRT when new features are added. If this happens it
is helpful to provide a backtrace for the developers to find and fix the
bug.

I will explain one possibility how to get a backtrace of profanity
(or any other TUI application)[^1]:
<!--more-->

### Preparation

The following requirements must be installed:

* [gdb][10]
* gdbserver
* debug symbols (depending on your distribution they might already be included)
	* e.g. profanity-dbgsym (for debian)
	* e.g. libstrophe0-dbgsym (for debian)
	* e.g. libexpat1-dbgsym (for debian)


### Run profanity

* Open terminal #1
	* Run `gdbserver localhost:1234 /usr/bin/profanity`
* Open terminal #2
	* Run `gdb /usr/bin/profanity`
	* Enter `target remote localhost:1234`
	* Enter `c`
* Profanity opens in terminal #1
	* Reproduce crash
* A *gdb* command line opens in terminal #2
	* Enter `bt` or `bt full` [^2]
* Create an issue in the [bugtracker][20] and include the output of the previous step (see [this example][30])

[^1]: This explanation was first published [on my personal blog][40]. 
[^2]: `bt full` gives a much more detailled output but in most cases `bt` is enough for the dev to know what's going on.

[10]:https://www.gnu.org/software/gdb/
[20]:https://github.com/profanity-im/profanity/issues
[30]:https://github.com/profanity-im/profanity/issues/1159
[40]:https://blog.mdosch.de/2019/09/20/how-to-debug-a-tui-application/
