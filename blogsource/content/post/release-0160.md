---
title: Profanity 0.16.0
date: 2026-11-14T00:00:00+01:00
authors: jubalh
---

Continuing our catch-up series: in February 2026, 6 months and 66 commits after 0.15.1, we released Profanity 0.16.0.

5 people contributed code to this release: @balejk, @mcalierno, @ritesh006, @sjaeckel, and @jubalh.

If you would like to support Profanity development: [please donate](https://profanity-im.github.io/donate.html).

## Meson Build System (Experimental)
A major addition in 0.16.0 was adding support for the Meson build system as a test, with the goal to evaluate whether we can later use it to replace Autotools entirely.

This release includes both build systems in parallel. Users and packagers could continue building Profanity via `./configure && make` with Autotools as usual, while also having the option to test building with `meson setup build && ninja -C build`. We encourage packagers and users to give Meson a spin and report any issues!

## The `/changes` Command
Have you ever tweaked various settings during a session and in the end wondered what you actually changed?
We added a new `/changes` command that lists all modifications made in your runtime configuration compared to your saved configuration file.

## Configuration & Multi-Instance Fixes
Running multiple Profanity instances concurrently is now safer: we fixed a bug where newly created accounts could be accidentally overwritten by another running instance. We also resolved a reconnect loop that could occur when reconnecting before any account had been configured.

## PubSub & Encryption
Profanity now checks whether your XMPP server actually supports PubSub before attempting to publish encryption keys, avoiding unnecessary error stanzas on servers without PubSub support. We also fixed OTR detection issues and resolved an OMEMO initialization issue during startup.

## Platform & Process Improvements
- Fixed compilation issues on Apple Silicon Macs.
- Added graceful handling for `SIGTERM` and `SIGHUP` signals to cleanly shut down the client.
- Added a Cygwin build to our CI.
- Expanded the man page to explain the different kinds of messages in Profanity.

## Details
To read up on all the changes, fixes, and improvements in this release, please check the [0.16.0 release notes](https://github.com/profanity-im/profanity/releases/tag/0.16.0).

