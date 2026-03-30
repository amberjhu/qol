# Quality of Life (QoL) improvements

When moving to a new system, whether it's setting up a virtual private server or setting up a new MacOS daily driver, 
I always need some quality of life upgrades. For example, it always grinds productivity to a halt when my `.vimrc` isn't set up properly. 
So, let's put these all in one place for the future.

# Linux

## Ubuntu

|Question|Diagnosis|Fix|
|---|----|---|
|Why is my `.vimrc` not working? Why isn't `:scriptnames` working? It's probably tiny Vim. |`readlink -f 'which vi'`|`sudo apt install vim`|
