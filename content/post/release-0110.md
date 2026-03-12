---
title: "Profanity 0.11.0"
date: 2021-07-14T00:00:00+01:00
authors:
  - jubalh
---

Six months and 242 commits after 0.10.0 we are happy to release 0.11.0.

10 people contributed code to it: @DebXWoody, @xenrox, @mwuttke97, @dustinlagoy, @kaffeekanne, @CIacademic, @rjc, @raspbeguy, @Mic92 and @jubalh.

Thanks to everybody who was involved, be it testing, writing documentation, updating the website or whatever you did!
I also would like to express my gratitude to my sponsors [mdosch](https://github.com/mdosch), [wstrm](https://github.com/wstrm), [huhndev](https://github.com/huhndev), [matteobin](https://github.com/matteobin) and [jamesponddotco](https://github.com/jamesponddotco).

## MAM
This release has experimental support for [XEP-0313: Message Archive Management](https://xmpp.org/extensions/xep-0313.html).
It is not quite usable yet and we recommend that you only enable it (`/mam on`) if you are a developer or know what you are doing.

See [issue 660](https://github.com/profanity-im/profanity/issues/660) for details.

## MUC
You can now display offline members in the occupants panel: ` /occupants default show|hide [jid|offline]`.

Via `/affiliation request` you can request *voice* in MUCs.

And `/affiliation register` lets you register a nickname with a MUC.

From now on Profanity will use direct messages instead of MUC Private Messages for non-anonymous MUCs.

## Files
We updated [XEP-0363: HTTP File Upload](https://xmpp.org/extensions/xep-0363.html) to version 1.0.0 and Profanity can now also handle paths containing the `file://` prefix.

## Account
Via the freshly introduced `/changepassword` command you can change your account password.

## Multiline messages
You can now write multiline messages via `/editor`. This is generally handy since it will give you all the capabilities of your favourite editor. Like spell checking etc.

## OMEMO
We introduced an omemo trustmode `/omemo trustmode manual|firstusage|blind`. Read more about it in the manual.

## Marking windows
With alt-a we can jump to all unread windows.
However sometimes we read something but don't have time to reply. For such situations we added the ability to mark windows with an attention flag.
Press alt-f to toggle the flag and use alt-m to switch to marked windows. Use `/wins attention` to list them in the console.

## Call notice
When someone tries to call via [XEP-0353: Jingle Message Initiation](https://xmpp.org/extensions/xep-0353.html) we now display a message in the console.

## Server contact information
We now implement the lookup of server contact information according to [XEP-0157](https://xmpp.org/extensions/xep-0157.html). Use `/disco info`.

## Spam
You can now report spam according to [XEP-0377: Spam Reporting](https://xmpp.org/extensions/xep-0377.html) via `/blocked report abuse|spam <jid> <message>` to your server admin.

In case you just don't want to get ANY messages at all from people that you don't have subscribed to in your roster then you can use `/silence on`.
Use this with care though since generally we want people to be able to contact us in instant messaging :-).

## Details
We also added plenty of fixes. To read up on those and further details, please check the [changelog](https://github.com/profanity-im/profanity/releases/tag/0.11.0).
