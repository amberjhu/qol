# Here Be Dragons

A notebook for me to map out Unix filesystems.

- `/etc/`
  - `passwd`
|Username|Password|UID|GID|Full Name|Home dir|Login shell|
|---|---|---|---|---|---|---|
|daemon|x|1|1|daemon|/usr/sbin|/usr/sbin/nologin|
|amber|x|1000|1000|Amber|/home/amber|/bin/bash|
  - `shadow` this is where the actual password hashes are kept, and only `root` has access
- `/home/$USER/` AKA `~`
  - `bin/` or `.local/bin/`
- `/dev/` Devices (not developer/development)
  - `null` pipe output into this file to get rid of it. Important to write it as `myproc > /dev/null` without the last `/`
  - `stdin, stdout, stderr` link to `/proc/self/fd/` 0, 1, and 2 respectively
  - `sd*` Hard drive(s)
  - `nvme*` solid state drive(s)
- `/root/` AKA `~` to `root` user
- `/bin/` binaries for all the users
- `/sbin/` binaries that only the super user can run
- `/opt/` "optional" AKA third-party software
  - `zoom/`
  - `f5/vpn/`
