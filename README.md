# Quality of Life (QoL) improvements

When moving to a new system, whether it's setting up a virtual private server or setting up a new MacOS daily driver, 
I always need some quality of life upgrades. For example, it always grinds productivity to a halt when my `.vimrc` isn't set up properly. 
So, let's put these all in one place for the future.

## Setup Problems

|Question|Diagnosis|Fix|
|---|----|---|
|Why is my syntax highlighting/spacing/status line not working in Vim?|`:scriptnames` in vi shows no `~/.vimrc`|`./setup.sh` answer yes to .vimrc|
|Why isn't `:scriptnames` working? It's probably tiny Vim. |`readlink -f $(which vi)` says `tiny.vim` or similar|`./setup.sh --only vim`|
|My commits on GitHub/GitLab show an anonymous profile pic| Click on the commit author details. |FIXME|

## Bash Cheat Sheet

|Question|Command|
|---|---|
|Which Linux distro version am I on?|`lsb_release -a`|
|How do I confirm a checksum?|`echo "$SUM $FILE" | sha256sum -c`|

## TODO

- Implement `--only package` flag for setup.sh
