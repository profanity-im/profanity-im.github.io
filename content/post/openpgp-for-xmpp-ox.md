---
title: "Profanity and OpenPGP for XMPP (OX)"
date: 2022-03-24T15:07:30+02:00
authors:
  - debxwoody
---

We have been to implement OX in profanity. OX is 
[XEP-0374: OpenPGP for XMPP Instant Messaging](https://xmpp.org/extensions/xep-0374.html) which 
may replace [XEP-0027: Current Jabber OpenPGP Usage](https://xmpp.org/extensions/xep-0027.html).

It is part of Profanity since version 0.10 but got some fixes since then.

Feel free to try and test the implementation. Let us know, if you have some
issues and support the development via testing and reporting bugs.

How does it works? There are some parts which will be done directly with
GnuPG. You will see those `gpg` commands which needs to be executed in the
shell. The commands within profanity are the `/ox` commands.

# Generate OpenPGP key materials
The first step is to create a OpenPGP key pair. The key pair generation
will be done with the `gpg` command of GnuPG.

```
gpg --quick-generate-key xmpp:alice@domain.tld future-default default 3y
```

This command will generated a OpenPGP key with a UID
`xmpp:alice@domain.tld`. The option `future-default` has been used to
generate a ed25519/cv25519 key. The expiration date will be in three
years. Replace the Jabber ID with your JID and do **not** forget the URI
`xmpp:` prefix.

```
pub   ed25519 2021-09-21 [SC] [verfällt: 2024-09-20]
      583BAE703A801095B6B71A56BD801174B1A0B84A
uid                      xmpp:alice@domain.tld
sub   cv25519 2021-09-21 [E]
```

# Export your public key
You need to export your public key to share this public key with your
buddy. Use the command below to export public key:

```
gpg --export \
  --export-options export-minimal \
  --export-filter 'keep-uid=uid =~ xmpp:alice@domain.tld' \
  --export-filter 'drop-subkey=usage =~ a' \
  583BAE703A801095B6B71A56BD801174B1A0B84A \
  > /tmp/pep-key.gpg
```

The key will be exported to `/tmp/pep-key.gpg`. You may check the key with
the command below:

`gpg --show-key --with-sig-list /tmp/pep-key.gpg`

Keep in mind: Public keys may have some information (signatures, name,
e-mail address). Be careful which data will be exported. The
`export-options` and `export-filter` option of GnuPG will help you to
filter the data.

# Publish your key
You can use profanity to publish your exported key into your account (PEP).
The `/ox announce` command will publish your key.

```
/ox announce /tmp/pep-key.gpg
Annonuce OpenPGP Key for OX /tmp/pep-key.gpg ... 
```

The command will create two PEP node records to store the key.

# Discover keys
The `/ox discover` command will be used to discover keys.

```
/ox discover buddy@domain.tld
Discovering Public Key for buddy@domain.tld 
1234567890ABCDEF1234567890ABCDEF12345678
```

To request and import a key, you can use the `/ox request` command.

```
/ox request buddy@domain.tld 1234567890ABCDEF1234567890ABCDEF12345678
Requesting Public Key 1234567890ABCDEF1234567890ABCDEF12345678 for buddy@domain.tld
Public Key imported 
```

The key will be imported into your gnupg keyring.

# Sign the imported key

The key can been shown via gpg `gpg -k xmpp:buddy@domain.tld`.
Make sure the key is the key of your buddy and sign the key with your key.

```
gpg --ask-cert-level --default-key 583BAE703A801095B6B71A56BD801174B1A0B84A --sign-key 1234567890ABCDEF1234567890ABCDEF12345678
```

The command `/ox contacts` will show the keys with XMPP-UID.
The command `/ox keys` will show all known OpenPGP keys.

# Use OX
Within a chat window you can start OX via `/ox start` and stop it via `/ox end`.

Messages will be send signed and encrypted.

