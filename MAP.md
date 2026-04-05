# Here Be Dragons

A notebook for me to map out Unix filesystems.

- `/bin/` binaries for all the users
- `/dev/` Devices (not developer/development)
	- `null` pipe output into this file to get rid of it. Important to write it as `myproc > /dev/null` without the last `/`
	- `stdin, stdout, stderr` link to `/proc/self/fd/` 0, 1, and 2 respectively
	- `sd*` Hard drive(s)
	- `nvme*` solid state drive(s)
- `/etc/`
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
	- `bin/` or `.local/bin/`
- `/proc/` Files related to currently active processes
	- `self/` Changes depending on which process is asking!
- `/root/` AKA `~` to `root` user
- `/sbin/` binaries that only the super user can run
- `/usr/`
	- `lib/`
		- `systemd/system/` Unit configuration files
			- These ones are also at the system level like `/etc/systemd/system` but get loaded later (e.g., [Jellyfin home server](jellyfin.org)
