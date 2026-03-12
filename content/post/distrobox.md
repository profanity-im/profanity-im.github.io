---
title: "New Profanity Old System"
date: 2023-02-22T12:03:36+01:00
authors:
  - jubalh
---

Occasionally people visit our MUC asking how to run the latest profanity release on years old systems.
For some distributions people maintain a backports project, so you can get it from there if available.

Here we want to describe another methods, using containers, more specifically [distrobox](https://github.com/89luca89/distrobox).

# What's Distrobox?
It's basically a tool that let's you run another distribution on your system. It uses docker/podman to create containers that are well integrated into your host system.
This means all your Profanity config files etc will be in the usual place in `~/.config/profanity` and `~/.local/share/profanity`.

Be aware:
Profanitys configuration files might change with new versions. Usually we transform old config files into the new format. If you however use distrobox to run the latest Profanity and then want to go back to your old version it might be that your old Profanity doesn't understand the new or changed config options.

# Setup
You need to have docker/podman installed. And the daemon should be running.
Install distrobox preferably via your distribution package manager. Alternatively you can use the infamous line `curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh`.

In this guide we will use an openSUSE Tumbleweed maintainer, since it's a rolling release distribution that will always have the latest Profanity available.

```
host$ distrobox-create --name profanity-on-tw --image opensuse/tumbleweed
Using default tag: latest
latest: Pulling from opensuse/tumbleweed
f7cda0ba8b2c: Pull complete
Digest: sha256:8d4c43253942e84737681ee8307c79be4ca9ec9011b6616d40b2ef204143ab88
Status: Downloaded newer image for opensuse/tumbleweed:latest
docker.io/opensuse/tumbleweed:latest
Creating 'profanity-on-tw' using image opensuse/tumbleweed	 [ OK ]
Distrobox 'profanity-on-tw' successfully created.
To enter, run:

distrobox enter profanity-on-tw

profanity-on-tw
```

We can now enter this container and install profanity in it via:
```
host$ distrobox-enter profanity-on-tw
Container profanity-on-tw is not running.
Starting container profanity-on-tw
run this command to follow along:

 docker logs -f profanity-on-tw

 Starting container...                  	 [ OK ]
 Installing basic packages...           	 [ OK ]
 Setting up read-only mounts...         	 [ OK ]
 Setting up read-write mounts...        	 [ OK ]
 Setting up host's sockets integration...	 [ OK ]
 Integrating host's themes, icons, fonts...	 [ OK ]
 Setting up package manager exceptions...	 [ OK ]
 Setting up rpm exceptions...           	 [ OK ]
 Setting up sudo...                     	 [ OK ]
 Setting up groups...                   	 [ OK ]
 Integrating host's themes, icons, fonts...	 [ OK ]
 Setting up package manager exceptions...	 [ OK ]
 Setting up rpm exceptions...           	 [ OK ]
 Setting up sudo...                     	 [ OK ]
 Setting up groups...                   	 [ OK ]
 Setting up users...                    	 [ OK ]
 Executing init hooks...                	 [ OK ]

Container Setup Complete!
profanity-on-tw$ sudo zypper in profanity
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following 4 recommended packages were automatically selected:
  python310 python310-curses python310-dbm python310-pip

The following 16 NEW packages are going to be installed:
  libgdbm6 libgdbm_compat4 libmpdec3 libotr5 libpython3_10-1_0 libsignal-protocol-c2 libstrophe0 profanity
  profanity-mini python310 python310-base python310-curses python310-dbm python310-pip python310-setuptools
  shared-python-startup

16 new packages to install.
Overall download size: 15.7 MiB. Already cached: 0 B. After the operation, additional 60.1 MiB will be used.
Continue? [y/n/v/...? shows all options] (y): y
Retrieving: libgdbm6-1.23-1.10.x86_64 (openSUSE-Tumbleweed-Oss)                                  (1/16),  53.0 KiB    
Retrieving: libgdbm6-1.23-1.10.x86_64.rpm ........................................................[done (303.6 KiB/s)]
Retrieving: libmpdec3-2.5.1-2.12.x86_64 (openSUSE-Tumbleweed-Oss)                                (2/16),  82.8 KiB    
Retrieving: libmpdec3-2.5.1-2.12.x86_64.rpm ......................................................[done (466.2 KiB/s)]
Retrieving: libotr5-4.1.1-4.1.x86_64 (openSUSE-Tumbleweed-Oss)                                   (3/16),  60.7 KiB    
Retrieving: libotr5-4.1.1-4.1.x86_64.rpm .........................................................[done (624.3 KiB/s)]
Retrieving: libsignal-protocol-c2-2.3.3-1.15.x86_64 (openSUSE-Tumbleweed-Oss)                    (4/16), 163.7 KiB    
Retrieving: libsignal-protocol-c2-2.3.3-1.15.x86_64.rpm ..........................................[done (773.8 KiB/s)]
Retrieving: libstrophe0-0.12.2-1.3.x86_64 (openSUSE-Tumbleweed-Oss)                              (5/16),  89.5 KiB    
Retrieving: libstrophe0-0.12.2-1.3.x86_64.rpm ....................................................[done (548.6 KiB/s)]
Retrieving: shared-python-startup-0.1-6.9.noarch (openSUSE-Tumbleweed-Oss)                       (6/16),  12.9 KiB    
Retrieving: shared-python-startup-0.1-6.9.noarch.rpm ...........................................................[done]
Retrieving: libgdbm_compat4-1.23-1.10.x86_64 (openSUSE-Tumbleweed-Oss)                           (7/16),  27.7 KiB    
Retrieving: libgdbm_compat4-1.23-1.10.x86_64.rpm ...................................................[done (1.2 KiB/s)]
Retrieving: libpython3_10-1_0-3.10.9-2.2.x86_64 (openSUSE-Tumbleweed-Oss)                        (8/16),   1.3 MiB    
Retrieving: libpython3_10-1_0-3.10.9-2.2.x86_64.rpm ..............................................[done (882.1 KiB/s)]
Retrieving: python310-base-3.10.9-2.2.x86_64 (openSUSE-Tumbleweed-Oss)                           (9/16),   9.1 MiB    
Retrieving: python310-base-3.10.9-2.2.x86_64.rpm .................................................[done (975.5 KiB/s)]
Retrieving: python310-setuptools-65.6.3-1.2.noarch (openSUSE-Tumbleweed-Oss)                    (10/16),   1.3 MiB    
Retrieving: python310-setuptools-65.6.3-1.2.noarch.rpm ...........................................[done (913.8 KiB/s)]
Retrieving: python310-pip-22.3.1-1.2.noarch (openSUSE-Tumbleweed-Oss)                           (11/16),   2.5 MiB    
Retrieving: python310-pip-22.3.1-1.2.noarch.rpm ..................................................[done (958.3 KiB/s)]
Retrieving: python310-3.10.9-2.2.x86_64 (openSUSE-Tumbleweed-Oss)                               (12/16), 168.5 KiB    
Retrieving: python310-3.10.9-2.2.x86_64.rpm ......................................................[done (738.3 KiB/s)]
Retrieving: python310-dbm-3.10.9-2.2.x86_64 (openSUSE-Tumbleweed-Oss)                           (13/16), 141.2 KiB    
Retrieving: python310-dbm-3.10.9-2.2.x86_64.rpm ..................................................[done (806.6 KiB/s)]
Retrieving: python310-curses-3.10.9-2.2.x86_64 (openSUSE-Tumbleweed-Oss)                        (14/16), 171.6 KiB    
Retrieving: python310-curses-3.10.9-2.2.x86_64.rpm ...............................................[done (910.2 KiB/s)]
Retrieving: profanity-0.13.1-1.2.x86_64 (openSUSE-Tumbleweed-Oss)                               (15/16), 104.8 KiB    
Retrieving: profanity-0.13.1-1.2.x86_64.rpm ......................................................[done (744.9 KiB/s)]
Retrieving: profanity-mini-0.13.1-1.2.x86_64 (openSUSE-Tumbleweed-Oss)                          (16/16), 446.4 KiB    
Retrieving: profanity-mini-0.13.1-1.2.x86_64.rpm .................................................[done (934.5 KiB/s)]

Checking for file conflicts: ...................................................................................[done]
( 1/16) Installing: libgdbm6-1.23-1.10.x86_64 ..................................................................[done]
( 2/16) Installing: libmpdec3-2.5.1-2.12.x86_64 ................................................................[done]
( 3/16) Installing: libotr5-4.1.1-4.1.x86_64 ...................................................................[done]
( 4/16) Installing: libsignal-protocol-c2-2.3.3-1.15.x86_64 ....................................................[done]
( 5/16) Installing: libstrophe0-0.12.2-1.3.x86_64 ..............................................................[done]
( 6/16) Installing: shared-python-startup-0.1-6.9.noarch .......................................................[done]
( 7/16) Installing: libgdbm_compat4-1.23-1.10.x86_64 ...........................................................[done]
( 8/16) Installing: libpython3_10-1_0-3.10.9-2.2.x86_64 ........................................................[done]
( 9/16) Installing: python310-base-3.10.9-2.2.x86_64 ...........................................................[done]
(10/16) Installing: python310-setuptools-65.6.3-1.2.noarch .....................................................[done]
(11/16) Installing: python310-pip-22.3.1-1.2.noarch ............................................................[done]
(12/16) Installing: python310-3.10.9-2.2.x86_64 ................................................................[done]
(13/16) Installing: python310-dbm-3.10.9-2.2.x86_64 ............................................................[done]
(14/16) Installing: python310-curses-3.10.9-2.2.x86_64 .........................................................[done]
(15/16) Installing: profanity-0.13.1-1.2.x86_64 ................................................................[done]
update-alternatives: using /usr/bin/profanity-mini to provide /usr/bin/profanity (profanity) in auto mode
(16/16) Installing: profanity-mini-0.13.1-1.2.x86_64 ...........................................................[done]
```

Notice how the bash prompt changed from `host$` to `profanity-on-tw$`, which is the name we gave our container.
So the call to zypper happened inside that container. You can now start profanity. And on your host system you will then see the usual files in `~/.config/profanity`.
Type `exit` to get out.

# Usage
Each time you want to start profanity you now have to do enter the container and start it there:
```
host$ distrobox-enter profanity-on-tw
profanity-on-tw$ profanity
```

You have however also the option to "export" profanity to your host system.
Some people have a `~/bin`, `~/.local/bin` or another directory where they put binaries or scripts which they make available via the `$PATH` variable.
Here we will use the `~/.local/bin` folder.

```
profanity-on-tw$ distrobox-export --bin /usr/bin/profanity --export-path $HOME/.local/bin
```

Now you can call `profanity` even from the host system. It will be the latest version of Profanity and all its dependencies, running inside a container. With full access to your usual environment.

# Uninstall

```
host$ distrobox-stop profanity-on-tw
host$ distrobox-rm profanity-on-tw
```

