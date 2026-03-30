vim9script
# ^^^^^^^^ This has to be the first line, otherwise syntax like # comments won't work

# Copyright 2026 Amber Hu
# Use :scriptnames to see whether this vimrc loaded properly

# Line numbers and whitespace
set number
set tabstop=2
set shiftwidth=2
# Insert spaces when Tab key is pressed
set expandtab

# FIXME: Make markdown indent with tab

# Searching
set ignorecase
set showmatch

# Bells off!
set belloff=all

# Visualizing tabs and newlines
set listchars=tab:▸\ ,eol:¬

# Show EOL type and last modified timestamp, right after the filename
# Set the statusline
set statusline=%f               # filename relative to current $PWD
set statusline+=%h              # help file flag
set statusline+=%m              # modified flag
set statusline+=%r              # readonly flag
set statusline+=\ [%{&ff}]      # Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  # last modified timestamp
set statusline+=%=              # Right align the following group:
# See below for what this group does
set statusline+=%(%.50F\ %=%l,%c%V\ %P%)
#set statusline+=%(              # Begin group
#set statusline+=\ %.50F\          # Full file path
#set statusline+=%l,%c%V           # Position in buffer: linenumber, column, virtual column
#set statusline+=\ %P              # Position in buffer: Percentage
#set statusline+=%)              # End group

# Status line always visible
set laststatus=2

# Make highlights visible on color terminal
hi CurSearch cterm=reverse
hi Search ctermbg=gray
hi Search ctermfg=white
