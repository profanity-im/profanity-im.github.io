title: Profanity, a console based XMPP client - User Guide
subtitle: Plugins

${section_start}

### Contents

- [Overview](#overview)
- [Featured Plugins](#featured-plugins)
- [Developing Plugins](developing-plugins)

     - [Python](#python),
     - [C](#c)

- [Themes and Settings](#themes-and-settings)
- [Contributing Plugins](#contributing-plugins)

${section_end}

${section_start}


#### Overview

Profanity supports plugins written in Python and C. The
[profanity-plugins](https://github.com/profanity-im/profanity-plugins)
project contains various plugins maintained by Profanity's author and other
community maintained plugins.

The master branch of the plugins repository is in sync with development in the
master branch of Profanity. Branching is used to maintain plugins for releases
of Profanity:

| Version | Code link |
| :---    | :---      |
| Profanity 0.5.0 | [https://github.com/profanity-im/profanity-plugins/tree/0.5.0](https://github.com/profanity-im/profanity-plugins/tree/0.5.0) |
| Profanity 0.5.1 to 0.6.0 | [https://github.com/profanity-im/profanity-plugins/tree/0.5.1](https://github.com/profanity-im/profanity-plugins/tree/0.5.1) | 

There is a
[known issue](https://github.com/profanity-im/profanity/issues/749)
that C plugins do not currently work on Cygwin.

To install a Python plugin:
```
/plugins install ~/projects-git/profanity-plugins/say.py
```

Any module dependencies for the plugin should be on the Python system path.
If a plugin imports modules relative to its location, these modules need to
manually be copied to `~/.local/share/profanity/plugins/`

To install a C plugin:
```
/plugins install ~/projects-git/profanity-plugins/pid/pid.so
```

See the [`/plugins`](reference.html#plugins) command for more information on
installing and enabling/disabling plugins.

If a plugin registers it's own commands, the usual [`/help`](reference.html#help)
command can be used to find out more information:
```            
/help say
```

${section_end}

${section_start}


#### Featured Plugins

This section list some of the plugins currently available.

| Code link | Functionality |
| :--- |:--- |
| [`ascii.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/ascii.py) | Convert text to ascii art text and send to the current recipient or room. |
| [`browser.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/browser.py) | Open received links in the system default browser. |
| [`clients.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/clients.py) | Show client software used by each occupant in the current chat room, using [xep-0092 Software version](https://xmpp.org/extensions/xep-0092.html). |
| [`imgur.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/imgur.py) | Send a local image file or a screenshot to a recipient or chat room using imgur.com. |
| [`paste.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/paste.py) | Send the contents of the clipboard to the current recipient or room. |
| [`termuxnotify.py`](https://github.com/Neo-Oli/profanity-termux-notification) | Notifications for Termux on Android. |

See also [`notifycmd.py`](https://github.com/Neo-Oli/profanity-notifycmd)
for a generic version to run any system command on new messages.

| Code link | Functionality |
| :---      | :---          |                 
| [`presence_notify.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/presence_notify.py) | Configure desktop notifications for presence updates from contacts. |
| [`say.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/say.py) | Read out loud messages from recipients or in chat rooms. |
| [`sounds.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/sounds.py) | Play sounds when messages received.|
| [`syscmd.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/syscmd.py) | Display the result shell commands in a new window. Send results of shell commands to recipients or chat rooms. |
| [`wikipedia-prof.py`](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/wikipedia-prof.py) | Search wikipedia and show search results, pages, links etc in a new window. |

${section_end}

${section_start}


#### Developing Plugins

Profanity provides an API for plugins to access various functionality. Plugins
may also implement 'hooks' that Profanity will call on specific events.

${section_end}

${section_start}


#### Python

Python plugins need to import the `prof` module to access the API.

Profanity may be compiled against Python 2 or Python 3, so plugins should be
able to work with both, the
[future](https://pypi.org/project/future/) library can be used in most cases.

Full documentation of the `prof` module and the hooks a plugin may implement
can be found at:

[0.5.1 to 0.6.0 Python API documentation](plugins/0.5.1/python/html/index.html)>

Previous versions:

[0.5.0](plugins/0.5.0/python/html/index.html)

${section_end}

${section_start}


#### C

C plugins need to include the `profapi.h` header to access the API, and must be
linked against `libprofanity` using the linker flag `-lprofanity`.

C plugins should include a `Makefile` to build a shared library (a `.so` file)
which is the file Profanity will load.
                    
Full documentation of the `profapi.h` header and the hooks a plugin may
implement can be found at:

[0.5.1 to 0.6.0 C API documentation](plugins/0.5.1/c/html/index.html)

Previous versions:

[0.5.0](plugins/0.5.0/c/html/index.html)

${section_end}

${section_start}


#### Themes and Settings

Plugins may make use of themes and settings by accessing the following files:

```
~/.local/share/profanity/plugin_themes
~/.local/share/profanity/plugin_settings
```

Example theme properties for
[syscmd.py](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/syscmd.py):

```
[system]
command=cyan
result=green
```

Example settings for
[say.py](https://github.com/profanity-im/profanity-plugins/blob/0.5.1/stable/say.py):

```
[say]
args=-v english -s 120
enabled=active
```

API functions are available to read and write to the settings and theme files.

Plugins should contain documentation on the available settings and colours,
most plugins have a command to manipulate settings.

${section_end}

${section_start}


#### Contributing Plugins
                
Submit a pull request to the
[profanity-plugins](https://github.com/profanity-im/profanity-plugins)
project.
                
If the current API doesn't have what you need, raise an issue at the
[Profanity](https://github.com/profanity-im/profanity) repository.

${section_end}
