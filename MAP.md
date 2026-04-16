# Here Be Dragons

A notebook for me to map out Unix filesystems.

# Glossary

# Snap vs. Flatpak

They are both ways of packaging dependencies and doing some level of sandboxing.
The benefit is that they don't mess with your setup. The drawback is that they don't integrate well into your setup.

Some users report slower startup times from Snap compared to Flatpak. Flatpak is only for Desktop apps, not server use cases.

## X11 vs. Wayland

Window managers. Every GUI application communicates over one of these protocols to a display server,
which is a process that manages the frame buffer.

## GNOME vs. KDE

Desktop environments. GNOME is the default for Ubuntu.

## dbus ([Desktop Bus](https://en.wikipedia.org/wiki/D-Bus))

Inter process communication for a GNOME desktop. Allows for publish-subscribe, but also remote procedure calls.

## ibus ([Intelligent Input Bus](https://en.wikipedia.org/wiki/Intelligent_Input_Bus))

Multilingual input system that you can download "keyboards" for, built on top of dbus. [Can run on GNOME, KDE, or X](https://github.com/ibus/ibus/wiki/DevGuide#run-gnome-kde-or-old-x-applications). I export all three of these variables in `/etc/environment`

## PGP vs. GPG

OpenPGP is an encryption protocol based on the proprietary encryption tool PGP (Pretty Good Privacy). 
GPG (GNU Privacy Guard) is an implementation of OpenPGP.

# Filesystem

- `/bin/` binaries for all the users
- `/dev/` Devices (not developer/development)
	- `null` pipe output into this file to get rid of it. Important to write it as `myproc > /dev/null` without the last `/`
	- `stdin, stdout, stderr` link to `/proc/self/fd/` 0, 1, and 2 respectively
	- `sd*` Hard drive(s)
	- `nvme*` solid state drive(s)
- `/etc/`
	- `environment` System-wide environment variables
	- `profile` System-wide bash profile
	- `services` **Network** services, not systemd services. Maps http to port 80 and so on
	- `shadow` this is where the actual password hashes are kept, and only `root` has access
	- `systemd/system` Unit configuration files for system-level units
		- See `man systemd.unit`
	- `passwd`
		- `/etc/passwd` file format:

|Username|Password|UID|GID|Full Name|Home dir|Login shell|
|---|---|---|---|---|---|---|
|daemon|x|1|1|daemon|/usr/sbin|/usr/sbin/nologin|
|amber|x|1000|1000|Amber|/home/amber|/bin/bash|

- `/opt/` "optional" AKA third-party software
	- `zoom/`
	- `f5/vpn/`
- `/home/$USER/` AKA `~`
	- `bin/` or `.local/bin/` Binaries installed for only this user
	- `.config/systemd/user` Unit/service files for only this user
		- Have to be enabled/started with `systemctl --user`
- `/proc/` Files related to currently active processes
	- `self/` Changes depending on which process is asking!
- `/root/` AKA `~` to `root` user
- `/sbin/` binaries that only the super user can run
- `/usr/`
	- `lib/`
		- `systemd/system/` Unit configuration files
			- These ones are also at the system level like `/etc/systemd/system` but get loaded later (e.g., [Jellyfin home server](jellyfin.org)
- `/var/`
	- `lib/`
		- `systemd/linger/` directory of files with usernames for users that can linger (systemd services run after they logout)
