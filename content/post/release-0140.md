---
title: "Profanity 0.14.0"
date: 2023-08-16T00:00:00+01:00
authors:
  - jubalh
---

Apologies for the late blog post.
We have good news though! Two weeks ago we released Profanity 0.14.0!

13 people contributed to this release: Daniel Santos, @DebXWoody, @H3rnand3zzz, @ike08, @MarcoPolo-PasTonMolo, @mdosch, @pasis, @paulfertser, @shahab-vahedi, @sjaeckel, @techmetx11, @thexhr and @jubalh.

Also a big thanks to our sponsors: @mdosch, @LeSpocky, @jamesponddotco and one anonymous sponsor!

We introduced a new `/privacy` command which should make it easier to find all privacy related settings and we introduced vCard support (XEP-0054)!

With `/plugins install` we have now a more convenient way to directly install plugins from the web.

Sharing of PGP keys got easier with the `/pgp sendpub` and `/pgp autoimport` commands. This is compatible with PSI and Pidgin, but doesn't have an official XEP.

You can configure libstrophe internal related settings via the new `/strophe` command.

There are plenty of more fixes and improvements. For a list of changes please see the 0.14.0 [release notes](https://github.com/profanity-im/profanity/releases/tag/0.14.0) or [git history](https://github.com/profanity-im/profanity/releases/tag/0.14.0).
