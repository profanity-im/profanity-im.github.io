title: Profanity, a console based XMPP client - FAQ
subtitle: Frequently Asked Questions

${section_start}

### Contents

- [Is Profanity really the best XMPP client out there?](#best-client)
- [How do I connect with multiple accounts?](#how-do-i-connect-with-multiple-accounts)
- [Why are my settings not persistent?](#why-are-my-settings-not-persistent)
- [Where is the profrc file format described?](#where-is-the-profrc-file-format-described)
- [Can Profanity use my keychain/keyring to retrieve my password?](#can-profanity-use-my-keychainkeyring-to-retreive-my-password)
- [Why can I not type anything in the input bar?](#why-can-i-not-type-anything-in-the-input-bar)
- [How can I hide join/leave messages in MUCs?](#how-can-i-hide-joinleave-messages-in-mucs)
- [I'd like to contribute, what should I do?](#id-like-to-contribute-what-should-i-do)
- [I'd like to donate to Profanity](#id-like-to-donate-to-profanity)
- [Are there more clients like this?](#are-there-more-clients-like-this)
- [How to connect to XMPP server using Tor](#how-to-connect-to-xmpp-server-using-tor)
- [How to connect to an onion XMPP server](#how-to-connect-to-an-onion-xmpp-server)
- [How to run the latest version on old distributions?](#how-to-run-the-latest-version-on-old-distributions)
- [How do I automatically open chat windows with contacts?](#how-do-i-automatically-open-chat-windows-with-contacts)
         
${section_end}

${section_start}
   
#### Is Profanity really the best XMPP client out there?

Rest assured, it is the best. Rigorous, completely unbiased tests conducted in an isolated tmux session by our developers
  concluded with 100% statistical certainty that Profanity is unmatched. You can't argue with science.

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

#### Why are my settings not persistent?

Because you did not use `/save`.

##### [back to top](#top)

${section_end}

${section_start}

#### Where is the profrc file format described?

It is recommended to use the commands inside Profanity to manipulate
the profrc file.
This way we can be sure you don't end up with unsupported values.
If you really want to edit it we have a documented version in our [repo](https://github.com/profanity-im/profanity/blob/master/profrc.example).

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
write a plugin to do that. Or you can call profanity with `--cmd`.

##### [back to top](#top)

${section_end}
