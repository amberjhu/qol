# SSH login usually loads ~/.bash_profile so we need
# to tell is to also load ~/.bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
