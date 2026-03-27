title: Profanity, a console based XMPP client - Account Configuration
subtitle: Account Configuration

${section_start}

### Contents

- [Configuring Accounts](#configuring-accounts)

${section_end}

${section_start}

### Configuring Accounts

The [<code>/account</code>](reference.html#account) command should be used to
modify the settings below.

The following is an example account configuration file with two configured
accounts.

```[jabber]
enabled=true
priority.online=10
priority.chat=20
priority.away=0
priority.xa=0
priority.dnd=-10
jid=someone@jabber.org
resource=laptop
presence.last=xa
presence.login=online
muc.service=conference.jabber.org
muc.nick=aperson

[work]
enabled=true
priority.online=2
priority.chat=1
priority.away=0
priority.xa=-5
priority.dnd=-10
jid=bob.smith@mycompany.org
server=talk.mycompany.org
resource=office
presence.last=online
presence.login=away
muc.service=rooms.mycompany.org
muc.nick=smithy
```

${section_end}
