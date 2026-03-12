---
title: "XML console in Profanity"
date: 2020-04-09T21:16:34+03:00
authors:
  - pasis
---

Profanity is an XMPP client that allows you to chat with friends. But one
feature makes it more than just a client. The name is XML console.

It has been implemented for a long time now, but hasn't found wide spread within
Profanity community. I still believe that the XML console is unpopular because
users haven't chance to find it and to try it out. And Profanity community has
a number of experts who use XMPP in their projects. If you're one of them,
Profanity can make life easier for you.

XMPP clients implement an XML console mostly for debugging purpose. To see XMPP
stream and analyze issues post factum. But Profanity has gone further and
implemented XML console with ability to send any data. One this small property
turned Profanity into a powerful developer tool. Let's see how to use it:

To open the XML console, simply run command: `/xmlconsole`. It opens a new
window with content of XMPP stream. Profanity starts displaying only new XMPP
stanzas. You won't see the part of XMPP stream before you open the window.
Format of the content is as follows:

```
21:24 - SENT:
21:24 - <iq id="id1" type="get"><ping xmlns="urn:xmpp:ping"/></iq>
21:24 -
21:24 - RECV:
21:24 - <iq id="id1" to="pasis@jabber.ua/profanity.754a" type="result"/>
21:24 -

```

Any text you send in the window is inserted into XMPP stream as is. So, you can
simply type a stanza, press enter and observe server behaviour. Why is it so
cool? Because you don't have to write any code while you learn a XEP or server
behaviour.

For example, you've decided to implement roster support with a low-level
library like libstrophe. Instead of debugging with writing code, printing
text to terminal or logs, you can connect to your server with Profanity and
type in the XML console:

```
<iq type="get" id="id2"><query xmlns="jabber:iq:roster"/></iq>
```
Now, you can observe what server replies in practice. In this way, you can
debug process which requires multiple iterations.

Hint: if you type a stanza without child element, don't forget to close the tag!
Pay attention to the "query" stanza in the above example - it has '/' before
closing tag.

And even you send something wrong, server will close connection and Profanity
will reconnect automatically. So, this is much faster than rewriting your code.

To demonstrate a different usecase, let's refer to XEP-0363. After requesting
a slot with an IQ stanza, you can upload file using curl command-line tool.
Again, no need to write any code for debugging.

Hope you will find this feature useful for you!
