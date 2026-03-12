---
title: "Profanity 0.12.0"
date: 2022-03-30T00:00:00+01:00
authors:
  - jubalh
---

Eight months and 207 commits after 0.11.0 we are happy to release 0.12.0.

16 people contributed code to it: @sjaeckel, @MarcoPolo-PasTonMolo, @paulfertser,
@DebXWoody, @trofi, @nandesu-utils, @carlocab, @binex-dsk, @nlfx, @JurajMlich,
@wstrm, @arya-pratap-singh, @a02c1175-5220-4e75-b7a1-18e20548305f,
@mdosch, @jugendhacker and @jubalh.

That certainly is one of our records!

Thanks to everybody who was involved, be it testing, writing documentation, updating the website or whatever you did!
I also would like to express my gratitude to my sponsors [mdosch](https://github.com/mdosch), [wstrm](https://github.com/wstrm), [jamesponddotco](https://github.com/jamesponddotco) and [LeSpocky](https://github.com/LeSpocky).

## libmesode
libmesode has finally been deprecated.
We now depend on libstrophe >= 0.11.0.
All the functionality from libmesode has been brought to libstrophe.

## Plugins
We tried to make it easier to use (Python) plugins.

In the process the `sourcepath` setting got removed see [here](https://github.com/profanity-im/profanity/commit/3b3a6b7a756e0f162d212249750524b7ce045cea) for more details.

And we finally support a global installation path for plugins.
So now we have to ways to install a plugins. Either by using the full path:

```
/plugins install ~/src/profanity-plugins/my.py
```

Or by using:

```
`/plugins install my.py`
```

The latter will check two location. Which are the local one `~/.local/share/profanity/plugins` and the global `/usr/local/share/profanity/plugins/`.

So distributions could actually create a `profanity-plugins` package that install to the global path. Users could then install/active it by running the above mentioned install command.

For more details see [here](https://github.com/profanity-im/profanity/pull/1598).

## In-band registration
We now support [XEP-0077: In-Band Registration](https://xmpp.org/extensions/xep-0077.html).
Learn to use it via `/help register`.

## UI
We got a new color theme, check it out: `/theme load snicket`.

You can now set UTF-8 signs not only for your OTR/OMEMO/PGP indicators but also for your: roster header char, roster contact char, roster resource char, roster private char, occupants char, occupants header char.

## User Mood
We now support [XEP-0107: User Mood](https://xmpp.org/extensions/xep-0107.html).
Try it out: `/mood set happy`.

## Editor
Additionally to `/editor` we now have: `/subject editor` and `/correct-editor`.

You can also always press alt-c to open the external editor and the result will be used in the inputwindow.
This works with every command.

## Quoting
If you want to quote someone just type `>` and then use TAB completion to cycle through the last messages. Type your reply and hit enter!

## Contributing
We reworked our contributions guide. New developers should now have it a lot easier.
See the [PR](https://github.com/profanity-im/profanity/pull/1640) and [CONTRIBUTING.md](https://github.com/profanity-im/profanity/blob/master/CONTRIBUTING.md).

## Details
We also got several important fixes in.
For all the details please see the [changelog](https://github.com/profanity-im/profanity/releases/tag/0.12.0).

