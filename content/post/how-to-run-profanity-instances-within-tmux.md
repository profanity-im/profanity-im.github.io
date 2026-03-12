---
title: "How to run profanity instances within tmux"
date: 2020-03-03T14:49:55+01:00
authors:
  - debxwoody 
---

If you have more than one XMPP account, you may run one profanity process per
account. For example `profanity -a AccountName`.

It's possible to start a tmux session with one window for each
profanity instance.

Create a tmux configuration file, e.g. in `~/.config/tmux`.

	mkdir ~/.config/tmux
	touch ~/.config/tmux/profanity.conf

Within the configuration file, you create a tmux session named `Profanity`.
Followed by one window per XMPP Account. Each window will run a profanity
followed by `-a accountname`.

	session-name Profanity
	neww -n "Private" profanity -a private 
	neww -n "Work" profanity -a work
	neww -n "Movim" profanity -a Movim

If you are using bash, you may like to define a alias in `~/.bash_aliases`.

	alias profanitymux='tmux new-session "tmux source-file ~/.config/tmux/profanity.conf"'

Done! You can start your profanity instances within a tmux session by running
`profanitymux`. tmux will create one window for each profanity instance. You can
switch the
tmux windows with CTRL-B + 1 or CTRL-B + 2,...

