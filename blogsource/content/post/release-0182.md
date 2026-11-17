---
title: Profanity 0.18.x
date: 2026-11-16T00:00:00+01:00
authors: jubalh
---

Between April and June 2026, we released the Profanity 0.18.x series, it consisted of 81 commits.

Code contributors to 0.18.x were: @GunniBusch, @balejk, @paulfertser, @bkmgit, @mdosch, and @jubalh.

If you would like to support Profanity development: [please donate](https://profanity-im.github.io/donate.html).

## Milestone: Meson Only
With 0.18.0, we achieved a huge milestone: Autotools support has been completely removed. Profanity can now only be built with Meson!

Transitioning fully to Meson brings various benefits to the project:
- **Build Speed:** Configuration with Meson and compiling with Ninja is noticeably faster than running Autotools' `configure` script and recursive `make`.
- **Maintainability:** We traded thousands of lines of m4 macros and boilerplate `Makefile.am` files for a concise, readable, and structured `meson.build`.
- **Cleaner Dependency Management:** Native support for modern pkg-config detection, compiler feature checks, and subprojects.

## libstrophe as a Subproject
Speaking of Meson subprojects, Profanity now supports building libstrophe directly as a subproject via Meson.

This makes life easier for developers and testers: you can clone and test the very latest development branch of both Profanity and libstrophe together without having to manually build, configure, and install libstrophe into your system.

## Asynchronous External Editor
One of the most requested architectural improvements has finally landed.

Previously, when opening an external editor via `/editor` or `Alt+C`, Profanity executed the editor synchronously, blocking the main event loop. If you took your time to write a lengthy message or got distracted while the editor was open, your XMPP server could drop the connection due to missed ping responses.

In 0.18.0, the external editor is completely asynchronous. The main event loop remains active in the background, keeping your connection alive, responding to server pings, and receiving incoming stanzas while you comfortably compose in your editor.

## Spell Checking Highlighting
Another long-awaited feature is spell checking support directly within the input window. Now we highlight misspelled words as you type. See `/help spellcheck` for setup and usage instructions.

## Point Releases: 0.18.1 & 0.18.2
We followed up quickly with two minor updates to polish the series:
- **0.18.1:** Fixed edge cases in the async editor, resolved a database migration failure, ensured message receipt requests are properly sent even when capabilities are not yet cached, and fixed running functional tests via Meson (`meson test`).
- **0.18.2:** Guarded against terminal writes while the process is suspended (`Ctrl+Z`), prevented OTR key exchange handshakes from inadvertently leaking presence information to strangers, and added a configurable `docdir` option to our Meson setup.

## Details
For more information and complete changelogs for the entire 0.18.x series, please check the release notes on GitHub:
- [0.18.0 Release Notes](https://github.com/profanity-im/profanity/releases/tag/0.18.0)
- [0.18.1 Release Notes](https://github.com/profanity-im/profanity/releases/tag/0.18.1)
- [0.18.2 Release Notes](https://github.com/profanity-im/profanity/releases/tag/0.18.2)
