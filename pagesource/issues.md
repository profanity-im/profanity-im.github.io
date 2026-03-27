title: Profanity, a console based XMPP client - Reporting issues
subtitle: Reporting Issues

${section_start}

### Contents

- [Where to report issues](#where-to-report-issues)
- [Attaching logs](#attaching-logs)
- [Attaching configuration files](#attaching-configuration-files)
- [Getting a backtrace](#getting-a-backtrace)

  - [Enabling coredumps](#enabling-coredumps)
  - [Rebuild in debug mode](#rebuild-in-debug-mode)
  - [Viewing the backtrace](#viewing-the-backtrace)


${section_end}

${section_start}


#### Where to report issues

The best place to report issues is at the
[github issue tracker](https://github.com/boothj5/profanity/issues).

Other options are the
[mailing list](https://lists.posteo.de/listinfo/profanity).

The following would be helpful in diagnosing/reproducing the issue if you can
possibly supply it:
environment (OS, OS version, window manager, terminal type),
profanity release version or commit hash if from development,
XMPP server and/or recipient's XMPP client if the issue only occurs with certain
servers/clients,
finally any information about the build configuration and enabled features.

If you cant supply the above information, a simple description will do.

${section_end}

${section_start}


#### Attaching logs

The logs can often help to diagnose an issue. Firstly run Profanity in debug
mode to enable full debug logging:
```
profanity -l DEBUG
```

Then recreate the issue and attach the log (or a useful section of it) found in:
```
$XDG_DATA_HOME/profanity/logs/profanity.log
```

Which on most systems is:
```
~/.local/share/profanity/logs/profanity.log
```

Remember to remove or obfuscate any private information in the logs. In
particular check for credentials in connection logging. For example the auth
mechanism PLAIN sends the credentials as a base64 string which can be easily
reversed to get your username and password, e.g.:
```
12/12/2014 14:22:01: conn: DBG: SENT: &lt;auth mechanism="PLAIN" xmlns="urn:ietf:params:xml:ns:xmpp-sasl"&gt;<b>AG9saXZlci5tdWVoc2FtAE5oYTEyMDhnIw==</b>&lt;/auth&gt;
```

${section_end}

${section_start}


#### Attaching configuration files
         
Some issues are only reproducible using certain configuration options, so
attaching your config can also help. Profanity stores its core config in:
```
$XDG_CONFIG_HOME/profanity/profrc
```

Which on most systems is:
```
~/.config/profanity/profrc
```

Account specific configuration is specified in:
```
$XDG_DATA_HOME/profanity/accounts
```

Which on most systems is:
```
~/.local/share/profanity/accounts
```

Remember to remove or obfuscate any usernames/passwords from the configuration
before sending, for example, account configuration will include your password
if you have set one using the [/account](reference.html#account) command.

${section_end}

${section_start}


#### Getting a backtrace

Segfaults and crashes usually result in a coredump which can be useful in
debugging the problem. If you have the time, the following instructions should
help when attaching a backtrace from a crash.

${section_end}

${section_start}


#### Enabling coredumps

The following command will enable coredumps of unlimited size to be generated
in the current terminal session:
```
ulimit -c unlimited
```

If you prefer to set a limit, the argument is in Kilobytes, for example to allow
coredumps of up to 100MB:
```
ulimit -c 102400
```

Add the command to your `~/.bashrc` or equivalent to enable coredumps for all
terminal sessions.

${section_end}

${section_start}


#### Rebuild in debug mode

Profanity needs to be rebuilt from source to enable more useful information in
the coredump.

In the source folder (where you extracted the download, or checked out from git)
run the following:
```
./bootstrap.sh
./configure-debug  # calls ./configure with debug options
make clean
make
```

This will only build an executable in the source folder and will not overwrite
your system installed version. To run the newly built version, in the source
folder run:
```
./profanity
```

Note, if you installed from Homebrew on OSX it is recommended to clone and
build from github (checking out the relevant release tag) using the above
steps, unless you are happy with editing and reinstalling brew formula.

${section_end}

${section_start}


### Viewing the backtrace

On Linux, you will need the GDB debugger installed for your distribution.

The coredump will be created in the folder in which you built and ran
profanity, firstly start GDB pointing to profanity and the coredump:
```
gdb ./profanity core
```

To view the backtrace in GDB:
```
bt
```

On OSX, the coredump can be found somewhere in the system console (usually in
Applications->Utilities->Console in the finder). It should be named with
"profanity" and the date and time of the crash.

${section_end}
