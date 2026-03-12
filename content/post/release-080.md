---
title: "Profanity 0.8.0"
date: 2020-02-03T14:46:08+01:00
authors:
  - jubalh
---

On 2012-02-02 the first commit to Profanity was done by [@boothj5](https://github.com/boothj5).
So now Profanity is already 8 years old! Happy Birthday!

As a present we release today the next version: [0.8.0](https://github.com/profanity-im/profanity/releases/tag/0.8.0)!
It's released five months after 0.7.0 and has 295 commits since then.

Also more and more people contribute to Profanity's development. A big thanks to:
[@paulfariello](https://github.com/paulfariello), [@svensp](https://github.com/svensp), [@aaptel](https://github.com/aaptel), [@aszlig](https://github.com/), [@mdosch](https://github.com/mdosch), [@pasis](https://github.com/pasis), [@mzagozen](https://github.com/mzagozen), [@quite](https://github.com/quite), [@weiss](https://github.com/weiss), [@Misaflo](https://github.com/Misaflo) and [@jubalh](https://github.com/).

![Profanity](/blog/img/profanity-rel-080.jpeg)

## New features
We got fingerprint autocompletion for the `/omemo trust` command.      
We got a gruvbox and solarized theme.

## MUC name display
You can now decide whether you want to have the MUCs name or JID displayed in the titlebar and roster:
See `/titlebar use [name|jid]` and `/roster room use name`.

## Avatars
Profanity is now able to download user avatars via XEP-0084 [#1240](https://github.com/profanity-im/profanity/issues/1240).
Use the `/avatar <jid>` command. And open it with `xdg-open ~/.local/share/profanity/avatars/<jid>.png` from your terminal.

## Trackbar
A trackbar was added so you can easily see where you last left off reading. [#1238](https://github.com/profanity-im/profanity/issues/1238)

## Consistent Color Generation for nicks
We gained support for XEP-0392 Consistent Color Generation for nicks [#1191](https://github.com/profanity-im/profanity/issues/1191).
See `/color`, `/occupants color`, `/roster color`.

## Save current line
Add option to store current line in history (like irssi down arrow behaviour) [#200](https://github.com/profanity-im/profanity/issues/200).
Imagine you write a long line of text, only to find out someone else wrote something where you want to reply first.
Now you can press alt+down-arrow to save the current line. Write a new one. Send it. And press arrow-up to get the saved line back from history.

## Highlight unread messages
You can now highlight unread messages with a different color in /wins [#895](https://github.com/profanity-im/profanity/issues/895).
New theming option is `cmd.wins.unread`.

## Switch to unread messages
A keyboard shortcut to select the next window with unread messages has been added: alt+a [#1114](https://github.com/profanity-im/profanity/issues/1114).

## Switch to windows
You can now switch to the first 20 open windows with alt + 1234567890qwertyuio instead of only the first 10 [#1114](https://github.com/profanity-im/profanity/issues/1114).

## Reload command
A command to reload your config has been added: `/reload`.

## Alternative config file
A possibility to specify an alternative config file has been added: Use `profanity -c ~/path/to/other/config`.

## Changes

### Preferences
Preferences are not immediately saved once you change them. You will need to issue the `/save` command from now on. This has the advantage that you can experiment with different settings and themes and only if you are happy with your changes you save them. If not everything will stay as it was.

### Themes
We changed the theme handling in Profanity.
So far if you loaded a theme with `/theme load bios` it loaded new colors but also other settings the theme makes. Like changing the OMEMO char to `X`.
If you decided you prefer `#` as your indication of OMEMO encrypted messages you set this in your preferences via `/omemo char #`. But if you later tried out different themes because you were set up with your current one it might have happened that you lost some settings [#1077](https://github.com/profanity-im/profanity/issues/1077).

For this reason `/theme load bios` will now only load the colors of a theme.
We have `/theme full-load bios` to load the complete theme.

### Error message in settings commands
Profanity has functions that display settings of a certain command. Like `/logging` displays the settings for group and chat logging.
So you know what value they have before you change them.
So far if you issued a setting command it displayed the information, but also informed you that the command was not valid `Invalid usage, see '/help logging' for details.`. This has been fixed. [#1237](https://github.com/profanity-im/profanity/issues/1237).

### XEP-0092
XEP-0092 Software Version, sends now the name of your operating system too.
You can switch this off with `/os off`.

### Standardize comamnds
In an attempt to standardize commands some functionality got reorganized in different/new commands:
 * `/tls show on|of` -> `/titlebar show|hide tls`
 * `/encwarn on|off` -> `/titlebar show|hide encwarn`
 * `/titlebar show|hide resource` additionally to `/resource titlebar on`
 * `/titlebar show|hide presence` additionally to `/presence titlebar on`
 * `/invite <contact>` -> `/invite send <contact>`
 * `/invites` -> `/invite list`
 * `/decline` -> `/invite decline`
 * `/online`, `/away`, `/dnd`, `/chat`, `/xa` -> `/status set online` etc.
 * `/status` -> `/status get`
 * `/chlog on` -> `/logging chat on`
 * `/grlog on` -> `/logging group on`
 * `/group` -> `/roster group`

Read [#1116](https://github.com/profanity-im/profanity/issues/1116), [#1224](https://github.com/profanity-im/profanity/issues/1224), [#1229](https://github.com/profanity-im/profanity/issues/1229) if you want to know more.

## MUC PM Messages
Log MUC PM messages [#1184](https://github.com/profanity-im/profanity/issues/1184), [#1214](https://github.com/profanity-im/profanity/issues/1214), so far this was actually not done.

## MUC Messages
We now use XEP-0359: Unique and Stable Stanza IDs to detect if MUC messages come from us or not [#1207](https://github.com/profanity-im/profanity/issues/1207).

## Clear command
Add `/clear` autocompletion and improve its documentation [#855](https://github.com/profanity-im/profanity/issues/855).

## Subscribed message
Don't print subscribed message if contact is already in roster [#1166](https://github.com/profanity-im/profanity/issues/1166).

## Fixes

### Timestamps
So far we just displayed the timestamp of the first <delay> tag we found. Now we fixed this to actually check for the oldest timestamp. Meaning that the time a message was send should now be when it was first delayed not the last or any other delay [#1254](https://github.com/profanity-im/profanity/issues/1254).

### OMEMO
Several OMEMO related bugs were fixed by @paulfarielle, @svensp, @aszlig.

### Occupants and roster chars
Occupants and roster chars have never actually been saved!
Seems noone discovered this for years until recently [#1244](https://github.com/profanity-im/profanity/issues/1244).

### Status messages
Allow setting of status message (which actually never worked before) [b846c49](https://github.com/profanity-im/profanity/commit/b846c4970bb8054ca2bacb8cebdbe4d9302f4cb6).
`/status set online "This is my text"`
`/status set away bye`
`/status set away`

### Date
If you configure Profanity to load the last few lines from the history in a chat window. It always displayed a date of `01-01-00` as this was hardcoded.
Now it acually uses the right one. Seems this has gone unnoticed for years too [#922](https://github.com/profanity-im/profanity/issues/922).

### Memory leaks
We fixed many memory leaks. Profanity should be much nicer now if you plan to never quit it.

### Log message carbons
Carbon copied messages now get logged too [#1181](https://github.com/profanity-im/profanity/issues/1181).
