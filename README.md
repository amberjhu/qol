# Quality of Life (QoL) improvements

When moving to a new system, whether it's setting up a virtual private server or setting up a new MacOS daily driver, 
I always need some quality of life upgrades. For example, it always grinds productivity to a halt when my `.vimrc` isn't set up properly. 
So, let's put these all in one place for the future.

## Setup Problems

|Question|Diagnosis|Fix|
|---|----|---|
|Why is my syntax highlighting/spacing/status line not working in Vim?|`:scriptnames` in vi shows no `~/.vimrc`|`./setup.sh` answer yes to .vimrc|
|Why isn't `:scriptnames` working? It's probably tiny Vim. |`readlink -f $(which vi)` says `tiny.vim` or similar|`./setup.sh --only vim`|
|My commits on GitHub/GitLab show an anonymous profile pic| Click on the commit author details. |`git config user.email EMAIL` where EMAIL is the email tied to your GitHub acct. It will not be publicly displayed |
|Why is the desktop icon for my 3rd party software just a gray gear?|`sudo vi lm-studio.desktop` and change `Icon` to `/opt/LM-Studio/resources/icon.ico`||

## Virtual Private Server (VPS) problems

|Question|Answer|Fix|
|---|---|---|
|Why is my `cargo build` crashing even though it builds fine on my local machine?|VPS servers have limited RAM, especially cheap ones|`cargo build -j 1` will usually work since it's meant to run on a machine with one CPU, and you only have one vCPU|
|Why are my systemd user services exiting after I end my SSH session?|By default, systemd cleans up user services when they logout.|Enable lingering with `sudo loginctl enable-linger $USER`|
|What's my public IP?|Network address translation obscures this, so we have to query a server to tell us|`host myip.opendns.com resolver1.opendns.com`|

## Bash Cheat Sheet

|Question|Command|
|---|---|
|Which Linux distro version am I on?|`lsb_release -a`|
|How do I confirm a checksum?|`echo "$SUM $FILE" \| sha256sum -c`|
|How do I get the process id (PID) of a background process with called `abc`|`pgrep abc`|
|How do I run a command in the background?|`command args &`|
|How do I see which processes I dispatched in the background of this shell?|`jobs`|
|How do I terminate one of those jobs?|`kill %1` to kill job 1, `kill %2`, etc.|
|How do I parse JSON from the command line?|Use `jq`, simplest way is to access a field: `jq .foo` will access the `foo` field of the JSON piped in.| 

## `systemd` cheat sheet

Source of truth: `man systemd.unit` or `man systemd.service`

`systemd` runs units, some of which are services. The configuration files are in `/etc/systemd/system/` and `/usr/lib/systemd/system` for system-level units. 
User level units are in `~/.config/systemd/user/`.

Unit config files are very [TOML](toml.io)-like, but simpler and the subsection syntax is different. Basically, each section is in brackets, followed by a list of key-value pairs. Spaces before and after the `=` are ignored.
Check out this [service file generator](https://mysystemd.talos.sh/) to help with the syntax.

```ini
[Unit]
Description = 

[Service]
ExecStart = 

[Install]
WantedBy = multi-user.target
```

## TODO

- Implement `--only package` flag for setup.sh
