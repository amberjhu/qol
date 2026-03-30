# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Display the exit status of the last command
PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
    local EXIT="$?"                # This needs to be first
    PS1=""

    local Reset='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BoldYel='\[\e[1;33m\]'
    local BoldBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT == 0 ]; then
        PS1+="${Gre}\u${Reset}"
    elif [ $EXIT == 1 ]; then
        PS1+="[${Red}!${Reset}]${Red}\u${Reset}"
    else
        PS1+="[${BoldYel}$EXIT${Reset}]${BoldYel}\u${Reset}"
    fi

    PS1+="${Reset}@${Gre}\h ${Reset}\W${Reset}$ ${Reset}"
}
