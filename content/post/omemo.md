---
title: "OMEMO"
date: 2020-11-27T17:14:07+01:00
authors:
  - debxwoody 
---

OMEMO with profanity.

### Hello OMEMO!

OMEMO needs crytographic materials. You can generated this crytographic
materials via `/omemo gen`.  If you have more than one device, make sure you are
trusting your other devices.  Check your fingerprints via `/omemo fingerprint`. 
You may wont trust all your devices:

```
/omemo trust <Your XMPP-ID> <Your fingerpint>
```

Check the fingerprint of your buddy. List the fingerprints of your buddy via 

```
/omemo fingerprint <XMPP-ID of your buddy>
```

Check the fingerprints with you buddy over a secure medium (phone or singed OpenPGP message)
and trust the buddy's fingerprint via the command:

```
/omemo trust <Buddy's XMPP-ID> <Buddy's fingerpint>
```

You can start a OMEMO Session via the omemo-start command `/omemo start <buddy's
XMPP-ID>`.

### Debugging
Get the device list of your Buddy. Change the `to` and the `from` tag of the
line shown below.

```
<iq type='get' from='your@domain.tld' to='buddy@domain.tld' id='getOmemoDeviceList'><pubsub xmlns='http://jabber.org/protocol/pubsub'><items node='eu.siacs.conversations.axolotl.devicelist'/></pubsub></iq>
```

Use the `/xmlconsole` to open the XMP Console Window and sent those line to your
server.

The Server should return a result of the `iq` with id `getOmemoDeviceList`.
There should be a `item`-Tag with the id `current` followed by a list of device
id.

```
<items node="eu.siacs.conversations.axolotl.devicelist">
	<item id="current">
	<list xmlns="eu.siacs.conversations.axolotl">
	<device id="174235744"/>
	<device id="71071234"/>
	<device id="22318128"/>
	</list>
	</item>
</items>
```

The known devices and fingerprints are stored in `~/.local/share/profanity/omemo/<account>/known_devices.txt`.
The trust information are stored in `~/.local/share/profanity/omemo/<account>/trust.txt`.

### QR Code
If you need a QR Code of you Fingerprint, check xmppc.
xmppc is a XMPP Command Line Tool which can be used to [generate a QR
Code](https://codeberg.org/Anoxinon_e.V./xmppc/wiki/Usage#user-content-omemo). 



