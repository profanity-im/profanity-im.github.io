---
title: Profanity 0.19.0
date: 2026-11-17T00:00:00+01:00
authors: jubalh
---

Wrapping up our catch-up series brings us to our latest release: Profanity 0.19.0, released in October 2026!

4 people contributed code to this release: onf, Jiho Kim, @YHNdnzj, and @jubalh.

A big thank you to all our testers, packagers, and supporters!
If you would like to support Profanity development: [please donate](https://profanity-im.github.io/donate.html).

## MUC MAM
The main feature of 0.19.0 is that this is the first release that supports MUC MAM.

Previously, MAM was only available for 1:1 direct chats. In 0.19.0:
- Profanity can now query message archives for joined MUC rooms.
- It tracks MAM capabilities per room.
- You can easily scroll up to load more history.
- Reconnection triggers an automatic catch-up sync using RSM ([XEP-0059: Result Set Management](https://xmpp.org/extensions/xep-0059.html)) to fetch missed messages without duplicate downloads.
- A visual indicator is now displayed when you scroll up and hit the end of the archive ("End of archive reached").
- With all these improvements in place, MAM is now enabled by default.

## Major Code Cleanup
Another major goal for 0.19.0 was a comprehensive cleanup and refactoring across the codebase, making Profanity leaner, safer, and easier to maintain. Some notable examples:
- Memory Safety: Standardized pointer deallocation across data structures to prevent dangling pointers and double frees.
- GLib Strings: Replaced error prone manual memory allocation calculations and custom string builders with glib functions.
- Modern Timestamps: Migrated away from obsolete POSIX `gettimeofday` calls to GLib's thread-safe `g_get_real_time`.
- Database Logic Consolidation: Unified SQLite history parsing functions and database query limit and count helpers.
- Security & Privacy: Passwords and GPG passphrases are now securely zeroized in memory upon destruction.
- Terminal Protection: Incoming messages are now sanitized to strip ANSI terminal control sequences and Unicode bidi overrides, preventing terminal disruption.

## MUC Self-Ping (XEP-0410)
Have you ever sat quietly in a MUC wondering why nobody writes anything?
Profanity 0.19.0 implements [XEP-0410: MUC Self-Ping](https://xmpp.org/extensions/xep-0410.html) along with a new `/mucping` command. If the room ping fails, Profanity detects the broken connection and triggers an automatic rejoin.

## Encrypted File Sharing for OX
When using `/sendfile` in an OX session, only the download link was encrypted in the message, while the actual file sat unencrypted on the HTTP upload server.

In 0.19.0, Profanity now encrypts the file locally with AES-256-GCM ([XEP-0454](https://xmpp.org/extensions/xep-0454.html)) before uploading it via HTTP File Upload ([XEP-0363](https://xmpp.org/extensions/xep-0363.html)). The resulting `aesgcm://` URL is then transmitted inside an OX signcrypt message. This ensures that both the file stored on the server and the message link are end-to-end encrypted.

You can control this behavior with the new command: `/ox encryptfile on|off`.
Which is enabled by default when Profanity is built with OMEMO support.

## Further Highlights
- Support for the XMPP URI 'join' query type in `/join` (e.g., `/join xmpp:room@muc.example.com?join`).
- Enforced mandatory TLS during in-band account registration.

## Details
For more information and the full list of features, bug fixes, refactorings, and cleanup, check out the [0.19.0 release notes](https://github.com/profanity-im/profanity/releases/tag/0.19.0).
