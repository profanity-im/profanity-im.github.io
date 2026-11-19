---
title: Profanity 0.20.0
date: 2026-11-19T00:00:00+01:00
authors: jubalh
---

Since our 0.19.0 release in October 2026, we have merged 255 commits into Profanity, bringing us to Profanity 0.20.0!

3 people contributed code to this release: onf, @YHNdnzj and @jubalh.

A big thank you to all our testers, packagers, and supporters!

## A Note on Supporting Profanity
When you sit down at a cafe, you leave a tip for the waitress. When you stop on the street to listen to a musician playing their heart out, you toss a coin into their case. It is a natural way to say: "Thank you. I see your work, and I appreciate what you do."

Free and open-source software is an essential foundation for our society—especially tools that protect digital communication, freedom, and privacy like XMPP and Profanity. But software doesn't write itself. Crafting features, fixing subtle protocol bugs, refactoring legacy code, and offering user support takes an immense amount of personal time and energy. Especially if you care about quality.

I believe that ethically and morally, free software cannot just be a one way street of pure consumption.
Giving back, even just the price of a coffee or a monthly tip, is what keeps independent projects alive and sustainable.

If Profanity brings value to your daily routine, please consider showing your [support](https://profanity-im.github.io/donate.html).

## Improved Desktop Experience
Profanity is a console client, but many of us run it inside a graphical desktop environments. In 0.20.0, we put a lot of care into improving the desktop integration:

We now install a `.desktop` file if you use `-Dinstall_desktop=true`. This is allowing desktop environment users to find and launch Profanity directly from their application menus and launchers. It will then start inside their default terminal.
We improved our desktop notifications too. We dropped the old `libnotify` dependency and now talk directly to D-Bus. Notifications now work across all desktop environments on both Wayland and X11.
We also display the contact's avatar in desktop notifications. If you want Profanity to automatically fetch and cache avatars for everyone on your roster, enable the new setting: `/avatar auto on`. Avatars already downloaded via `/avatar get` or `/vcard photo get save` will also be displayed. So you can decide whether you want automatically all avatars or just download a few manually.

The tray icon was modernized as well. We replaced the deprecated GTK tray icon with the modern FreeDesktop `StatusNotifierItem` standard over D-Bus. This means the tray icon finally works properly on Wayland! Packagers can get rid of the gtk dependency.

When you are busy working and a message arrives, a notification from your desktop appears and the tray icon changes to indicate unread messages. If you read the message in the notification and decide you don't need to answer immediately, you might still want the tray icon to alert you if *another* message arrives later. You can now click the tray icon to acknowledge and reset its alert state. When you later open the Profanity window, all unread message indicators in your chat windows will still be there.

## Stabilizing MAM
Following up on the MUC MAM support introduced in 0.19.0, stabilizing and polishing the experience was a major focus for 0.20.0:

The `/mam` command wsa merged directly into `/history` since this makes more sense and is less confusing for users.

We now display local history instantly. When opening a chat window, local history is displayed immediately so you can start reading right away while remote MAM synchronization completes in the background.

We fixed room capability detection so MAM queries are determined by the room's actual advertised features, avoiding false negatives or sending invalid queries to rooms without MAM support.

Service discovery errors from broken server components no longer stall MAM sync or bookmark joins.

## New Lua Plugin Engine
One of the biggest milestones in 0.20.0 is the complete overhaul of our plugin architecture. We retired our legacy C and Python plugin systems and replaced them with a dedicated, lightweight Lua engine.

Lua support can be built with `-Dplugins=enabled`.

The API is now structured into logical, idiomatic namespaces (prof.chat.*, prof.muc.*, prof.win.*, etc.).

Plugin installation is decoupled from loading. Earlier /plugins commands were often confusing. We cleaned them up with dedicated commands for each task: installing, enabling, disabling, and listing plugins with full tab-completion.

Profanity now checks `$XDG_DATA_DIRS/profanity/plugins/`. This means Linux distributions can finally package official plugins cleanly as regular system packages, without users needing to manually copy files into `~/.local/share/profanity/plugins`.

### Why drop Python and C?

Python was too heavy: Embedding CPython added 30–50 MB of memory overhead right on startup and noticeably slowed down launch times. Juggling the Python C-API and the GIL inside GLib's main event loop was complicated and had become essentially unmaintained. Packagers will be happy that they don't have to deal with python3-embed anymore.

C plugins were too risky: Plugins loaded dynamically via dlopen had no safety net whatsoever. Third party plugins could bring down the entire Profanity process. Maintaining libprofanity.so also caused recurring headaches on BSDs and Cygwin, and hardly anyone ever wrote C plugins anyway. Additionally this makes it nicer for packagers since we don't need libprofanity anymore.

A Lua state takes ~200 KB of RAM instead of 30–50 MB for Python.

If a plugin runs into a runtime error or bug, Profanity catches it, prints the error trace to your console window, and keeps running without a hiccup.

### How Execution Pipelines Work
Our C and Python plugins were executed in an unpredictable order. This caused problems when plugins depended on each other: for example, if one plugin expanded text or cleaned it first. And a second plugin logged that message in some way. The second plugin might run before the first plugin ever touched the text.

So for 0.20.0 we introduced execution pipelines.
Plugins are sorted in ascending order (lower numbers run first). For filter hooks (like prof_pre_chat_message_send or prof_pre_chat_message_display), the output of the first plugin is piped directly as the input into the next plugin in the chain. If two plugins have the exact same priority, Profanity breaks ties alphabetically by plugin name, so the execution order is always deterministic even across restarts.

## OMEMO Improvements
The OMEMO trust setting `blind` is now using **Blind Trust Before Verification** (BTBV).
It is a more balanced trust model for OMEMO encryption and bridges the gap between ease of use and high security.

Basically it means you trust a contacts fingerprints until you manually verify one of their devices via `/omemo trust`.
From then on all new devices need to get manually verified.

Profanity now automatically fetches bundles for newly discovered PEP devices in blind trust mode.

Contact encryption sessions are started lazily on demand, preventing redundant bundle requests and avoiding repeatedly querying empty device lists.

## Documented Configuration for Power Users
Something we forgot to mention in the 0.19.0 release notes: we extended and commented our `profrc.example` configuration file.

Over the years, users frequently asked for a documented config file that they could edit directly in their text editor. We were always a bit hesitant and recommended using the commands inside Profanity instead. Making settings via Profanity commands is still the safer option: the client validates your input so you don't enter invalid values, and commands can update several related parameters at the same time to keep your configuration consistent.

We wanted to give our power users what they asked for. The example configuration file now explains all available options, lists their possible values, and highlights the defaults.

## Universal URL Autocompletion
Have you ever pasted a link into a chat, and then wanted to quickly open it in your browser with `/url open <tab>`?
This didn't work. Profanity only indexed URLs from incoming messages sent by other people. This was a conscious design choice on my part because I figured people only cared to open links sent to them.

However, users in our MUC repeatedly asked for this to work both ways.

We completely redesigned URL autocompletion.

Tab completion for /url open and /url save now covers every URL in the chat buffer. Both incoming and outgoing messages, as well as room subjects and corrected messages (LMC).

It now works across all windows, including the Console window (window 1) and the XML console. If an XMPP component or bot prints a URL to your console, you can now Tab-complete and open it just like in a regular chat.

Instead of running regular expressions and allocating memory on every single message received like we used to do.
And which was wasteful, especially during huge MAM catch-up. Profanity now scans the buffer purely ondemand the first time you hit Tab. It is significantly faster and keeps memory usage down.

## Modernizing vCards: Forms Instead of Endless Subcommands

If you ever tried editing your vCard in Profanity before, you probably remember how painful it was: we had dozens of
  subcommands, weird parameters, and array indices like `/vcard set 3 street`. It felt like you had to run a dozen commands just to set your address.

We threw that away and now use a clean, unified experience using XMPP Data Forms.

Now you simply run /vcard edit. Profanity presents you with a clean, structured form where you can comfortably view and update your details in one place.

While working on this, we noticed that our form system had no way to unset or empty a single field once filled in. We added `/form clear <field>` so you can reset any field back to empty.

We also overhauled the way vCards are rendered when viewing contacts. We removed the ugly array indices and formatted the layout so profiles are much cleaner and nicer to read.

## Getting leaner
Part of keeping Profanity fast, stable, and lean means retiring obsolete features and ditching bloated dependencies that no longer make sense on modern systems.

### The `/paste` command
 Profanity used a GTK-based clipboard helper to grab your clipboard content and immediately send it. But sending immediately meant you had no chance to review or edit the text first. It also didn't work over SSH sessions, and it forced us to drag in heavy GTK3 dependencies just to read the clipboard.

 Simply use your terminal emulator's native paste shortcut. This places the text directly into the input line so you can review it before hitting Enter.

For long messages or formatting, use external editor mode (/editor or Alt+C), which is completely asynchronous and opens your favorite text editor.

### The `/script` command
The `/script run <file>` command executed a list of slash commands line-by-line from a text file. A concept borrowed from irssi. This was often done to join MUCs. But we have bookmarks with autojoin for that.

Some people used this to configure Profanity if they used multiple accounts. But you can use profiles via `profanity -c` for that.

If you need real automation just write a Lua plugin!

## Further Highlights
- Support joining chat rooms with your nickname specified directly in the JID (e.g. `/join room@conference.example.org/MyNick`).
- Extensive codebase cleanup: bumped GLib requirement to >= 2.80, dropped `gtk+-3.0` and `libnotify`, standardized memory deallocation and eliminated unnecessary heap allocations on redraws.

## Details
For more information and the full list of commits, features, and fixes, check out: [https://github.com/profanity-im/profanity/releases/tag/0.20.0](https://github.com/profanity-im/profanity/releases/tag/0.20.0).

