---
title: "Attention, attention!"
date: 2021-06-05T15:07:30+02:00
authors:
  - debxwoody
---

Hello folks,

we have implemented an attention flag in profanity.

The attention flag can be used to mark chats and groupchats where you would like to
pay particular attention.

This is only available on master, but will be in the next release (0.11.0).

# How it works

Open the chat or groupchat window and press shortcut `ALT+F`. Profanity will
display a line to inform you when the attention flag has been activated and
deactivated.

	05/06/21 15:25:49 - Staff restaurant: Lunch recommendations:
	05/06/21 15:27:04 ! Attention flag has been activated
	05/06/21 15:27:04 ! Attention flag has been deactivated

You can use the shortcut `ALT+F` to toggle the flag.

The `/wins attention` command can be used to display all windows with you pay
attention.

	15:38:19 - 3: Room roomA@conference.domain.tld
	15:38:19 - 15: Room roomB@conference.server.tld, 1 unread
	15:38:19 - 28: Room roomC@chat.server.tld
	15:38:19 - 29: Room roomD@chat.server.tld, 3 unread

You can just circle around the marked windows with shortcut `ALT+M`.


