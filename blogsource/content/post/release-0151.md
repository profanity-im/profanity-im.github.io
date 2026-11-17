---
title: Profanity 0.15.0 and 0.15.1
date: 2026-11-13T00:00:00+01:00
authors: jubalh
---

Profanity 0.15.0 was released back in March 2025, followed by the 0.15.1 bugfix release in August 2025. It has been a long time, and we never wrote a blog post about them! In an effort to inform our users better about our progress, we are publishing a series of blog posts covering our recent releases to catch up, and we will try to keep the blog up to date going forward.

Between 0.14.0 and 0.15.1, 11 people contributed code: @andreasstieger, @DebXWoody, @H3rnand3zzz, @ike08, @killerdevildog, @mdosch, @rodarima, @sjaeckel, @tjsweetblack, @ventosus, and @jubalh.

A warm thank you to everybody involved in testing, packaging, writing documentation, and submitting patches!

If you would like to support Profanity development: [please donate](https://profanity-im.github.io/donate.html).

## Statusbar & UI
We introduced a new dynamic mode for statusbar tabs. You can now use `/statusbar tabmode default|dynamic|actlist`, and the statusbar activity list now respects your `/statusbar show` setting.

MUC title behavior was improved across the roster, statusbar, and titlebar. We also added smooth scrolling support (including mouse wheel scrolling in supported terminals), added a new `/redraw` command, and mapped `Alt+Enter` to insert a newline. Profanity also no longer uses `xscreensaver` when running under Wayland.

## Plugins
Plugin installation is now more reliable: `/plugins install` supports HTTP redirects when fetching from URLs and won't crash if you execute it while disconnected. We also fixed error messages for `/plugins reload`.

## File Downloads
The default download location has been reorganized. Previously, `/url save $someurl` saved directly into `~/.local/share/profanity/downloads`. It now downloads to:
`~/.local/share/profanity/downloads/<from_jid>/<date>/<filename>`

In 0.15.1, Profanity now prints the exact location of decrypted files so you know where they landed.

## Automation
We added a new `--cmd` command-line option. This lets you automate startup commands, for example:
```
profanity --cmd /foo --cmd /bar --cmd /quit
```

## Encryption & Security
We resolved a crash on startup when using sequoia-pgp and fixed `/omemo fingerprint` crashing inside MUC rooms. Profanity now verifies if an OMEMO session already exists for MUCs, properly displays encryption indicators for messages restored from history, and correctly recognizes OX-encrypted carbons.

Furthermore, when reporting spam or abuse via `/blocked report`, Profanity now automatically removes the roster subscription.

## 0.15.1 Improvements
The 0.15.1 point release brought several targeted fixes:
- Added `iso8601` as a valid time format: `/time all set iso8601`.
- Fixed an issue where roster pushes could be ignored.
- Fixed compatibility with GPGME >= 2.0.0.
- Fixed test suite compilation with GCC 15 and `uintptr_t`.
- Significantly reduced noise in log files, alongside various code cleanups and memory leak fixes.

## Details
There are plenty of more fixes, code cleanup, and memory improvements. For a complete list of changes, please see the [0.15.0](https://github.com/profanity-im/profanity/releases/tag/0.15.0) and [0.15.1](https://github.com/profanity-im/profanity/releases/tag/0.15.1) release notes.
