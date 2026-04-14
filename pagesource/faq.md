title: Profanity, a console based XMPP client - FAQ
subtitle: Frequently Asked Questions

${section_start}

### Contents

- [How do I connect with multiple accounts?](#how-do-i-connect-with-multiple-accounts)
- [OMEMO doesn't work for me](#omemo-doesnt-work-for-me)
- [Why are my settings not persistent?](#why-are-my-settings-not-persistent)
- [Where is the profrc file format described?](#where-is-the-profrc-file-format-described)
- [Will Profanity run on &lt;some platform&gt;?](#will-profanity-run-on-some-platform)
- [Will Profanity work with Google Talk?](#will-profanity-work-with-google-gtalk)
- [Will Profanity work with Facebook Chat?](#will-profanity-work-with-facebook-chat)
- [Will Profanity work with Slack?](#will-profanity-work-with-slack)
- [Will Profanity work with MSN/Yahoo/AIM/IRC etc?](#will-profanity-work-with-msnyahooirc-etc)
- [Can Profanity use my keychain/keyring to retrieve my password?](#can-profanity-use-my-keychainkeyring-to-retreive-my-password)
- [Can I connect to more than one account at a time?](#can-i-connect-to-more-than-one-account-at-a-time)
- [Why does the F1 key open terminal help rather than going back to the main console window?](#why-does-the-f1-key-open-terminal-help-rather-than-going-back-to-the-main-console-window)
- [Why can I not type anything in the input bar?](#why-can-i-not-type-anything-in-the-input-bar)
- [How can I hide join/leave messages in MUCs?](#how-can-i-hide-joinleave-messages-in-mucs)
- [I've found a bug/have a feature request, who do I tell?](#ive-found-a-bughave-a-feature-request-who-do-i-tell)
- [I'd like to contribute, what should I do?](#id-like-to-contribute-what-should-i-do)
- [I'd like to donate to Profanity](#id-like-to-donate-to-profanity)
- [Are there more clients like this?](#are-there-more-clients-like-this)
- [How to connect to XMPP server using Tor](#how-to-connect-to-xmpp-server-using-tor)
- [How to connect to an onion XMPP server](#how-to-connect-to-an-onion-xmpp-server)
- [How to run the latest version on old distributions?](#how-to-run-the-latest-version-on-old-distributions)
- [How do I automatically open chat windows with contacts?](#how-do-i-automatically-open-chat-windows-with-contacts)
         
${section_end}

${section_start}
   
#### How do I connect with multiple accounts?

Profanity only supports one account per instance. But you certainly can run
several instances of Profanity! Run Profanity in multiple terminals or use a
terminal multiplexer like screen or tmux. An example setup can be seen in this
[blogpost](https://profanity-im.github.io/blog/post/how-to-run-profanity-instances-within-tmux.html).

##### [back to top](#top)

${section_end}

${section_start}

#### OMEMO doesn't work for me

OMEMO support was added in 0.7.0. Version 0.11.1 fixed a lot of common bugs.
But please make sure to run the *latest* version of Profanity.

A common error is that the PEP nodes are wrongly configured. It could be that
your server isn't configured the right way or that some client configured 
this the wrong way in the past. Profanity tries to correct this but might fail.
See [issue 1538](https://github.com/profanity-im/profanity/issues/1538) for
details.
        

##### [back to top](#top)

${section_end}

${section_start}

#### Will Profanity run on &lt;some platform&gt;?

Profanity should run on any POSIX system, see the [install guide](install.html)
for specifics.

##### [back to top](#top)

${section_end}

${section_start}

#### Will Profanity work with Google Talk?

Profanity was able to work with Google Talk. But in 2013 after Google merged
it's messenger products Google Talk, Google+ Messenger and Hangouts together
XMPP support was
[dropped](https://www.theverge.com/2013/5/15/4318830/inside-hangouts-googles-big-fix-for-its-messaging-mess). 


##### [back to top](#top)

${section_end}

${section_start}

#### Will Profanity work with Facebook Chat?

Facebook have recently announced that they will no longer support the open
XMPP chat protocol, so Profanity will no longer work with Facebook Chat.

##### [back to top](#top)

${section_end}

${section_start}

#### Will Profanity work with Slack?

Provided the XMPP gateway has been enabled for your team, Profanity will work.
See the
[Slack page on gateways](https://slack.zendesk.com/hc/en-us/articles/201727913-Connecting-to-Slack-over-IRC-and-XMPP)

##### [back to top](#top)

${section_end}

${section_start}

#### Will Profanity work with MSN/Yahoo/AIM/IRC etc?

No, Profanity is purely an XMPP chat client.

##### [back to top](#top)

${section_end}

${section_start}

#### Can Profanity use my keychain/keyring to retrieve my password?

Yes, the [`/account`](reference.html#account) command includes an
`eval_password` property which can be used to execute a script to retrieve your
password.

For example on Ubuntu using gnome-keyring and
[`secret-tool`](https://apps.ubuntu.com/cat/applications/libsecret-tools/):

To add the password:
```
secret-tool store --label="Bobs account" xmpp bob@server.org
```

You will be prompted to enter the password.

Command to use for the account <code>eval_password</code> property:
```
secret-tool lookup xmpp bob@server.org
```

On OS X, use the following command for the `eval_password` property:
```
security find-generic-password -s bob@server.org -w
```

You can also use Profanity together with `pass`, see this
[guide](https://hispagatos.org/post/xmpp_profanity_and_pass)

##### [back to top](#top)

${section_end}

${section_start}

#### Can I connect to more than one account at a time?

No, the recommended way is to use multiple terminal windows, or a terminal
multiplexer like GNU Screen or tmux.

##### [back to top](#top)

${section_end}

${section_start}

#### Why are my settings not persistent?

Because you did not use `/save`.

##### [back to top](#top)

${section_end}

${section_start}

#### Where is the profrc file format described?

Nowhere. Well, actually you cold read the source code.
But you should not edit the profrc file yourself anyways.
Just use the commands to manipulate the settings.
And don't forget to `/save` before exiting.

##### [back to top](#top)

${section_end}

${section_start}

#### Why does the F1 key open terminal help rather than going back to the main console window?

Some terminals have a key binding for F1 to open help. You can use the alt-num
keys to change windows, or if you prefer to use the F keys, you'll need to
change the terminal setting to open help with another key.

##### [back to top](#top)

${section_end}

${section_start}

#### Why can I not type anything in the input bar?

Profanity uses the ncursesw library to support wide characters, which requires
a UTF-8 encoding. Try running the following (or the equivalent for your
language's UTF-8 encoding) in the terminal before running profanity.
```
export LANG=en_US.UTF-8
```

###### [back to top](#top)

${section_end}

${section_start}

#### How can I hide join/leave messages in MUCs?

You can deactivate those messages with the following command:
```
/presence chat none
```

##### [back to top](#top)

${section_end}

${section_start}

#### I've found a bug/have a feature request who do I tell?

If you have a github account, you can log an issue on the
[issue tracker](https://github.com/profanity-im/profanity/issues?state=open).

Alternatively you are welcome to post on the
[mailing list](https://lists.posteo.de/listinfo/profanity).

##### [back to top](#top)

${section_end}

${section_start}

#### I'd like to contribute, what should I do?

A page has been written with some ideas for how to
[help out](helpout.html).
Any contributions/ideas are very welcome. Also see the
[CONTRIBUTING.md](https://github.com/profanity-im/profanity/blob/master/CONTRIBUTING.md)
file on GitHub.

##### [back to top](#top)

${section_end}

${section_start}

#### I'd like to donate to Profanity

If you want to pay the developers and maintainers of Profanity a coffee there
are various ways to do so.

On [GitHub](https://github.com/profanity-im/profanity) there is a *Sponsor*
button linking to relevant pages. If you want to send the money directly you
can ask for an IBAN via [email](mailto:jubalh@iodoru.org).

We also got selected for GitHub Sponsors. You can find the link also on the
*Sponsor* button on GitHub.

There is also the possibility to set a bounty for certain issues via
[Bountysource](https://www.bountysource.com/teams/profanity).
So in case you want to see a certain feature implemented or bug fixed you can
set a bounty there and the person doing the work gets the reward.

##### [back to top](#top)

${section_end}

${section_start}

#### Are there more clients like this?

Yes, there are several commandline clients:
[freetalk](https://www.gnu.org/software/freetalk/),
[mcabber](https://mcabber.com/),
[poezio](https://poez.io) and
[more clients](https://xmpp.org/software/clients.html).

##### [back to top](#top)

${section_end}

${section_start}

#### How to connect to XMPP server using Tor

To connect to the XMPP server by the Tor network, you must launch Profanity
with a tool called "[proxychains-ng](https://github.com/rofl0r/proxychains-ng)".

##### [back to top](#top)

${section_end}

${section_start}

#### How to connect to an onion XMPP server

An onion XMPP server is a server which is providing an onion address to reach it
inside the Tor network. You can specify the onion address with the
[`/account`](reference.html#account) command in Profanity.
```
/account set account_name server address.onion
```

##### [back to top](#top)

${section_end}

${section_start}

#### How to run the latest version on old distributions?

Some distributions, like Debian, have backports repositories. You can also run
Profanity in a container via distrobox. See our
[blogpost](https://profanity-im.github.io/blog/post/distrobox.html).

##### [back to top](#top)

${section_end}

${section_start}

#### How do I automatically open chat windows with contacts?

To the right side you can see your roster. It contains all your contacts and 
rooms (MUCs). MUCs can be automatically joined via bookmarks. If you want to
open a chat window to a user automatically upon the start of profanity you can
write a script to do that. Put `/msg theusersnickname` into
`~/.local/share/profanity/scripts/myautoscript`.
And configure your account to automatically launch that script
`/account set &lt;account&gt; startscript myautoscript`.

##### [back to top](#top)

${section_end}
