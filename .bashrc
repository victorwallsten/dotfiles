# ~/.bashrc: executed by bash(1) for non-login shells.

# This must be present for gpg-agent to work properly.
# See gpg-agent(1).
GPG_TTY=$(tty)
export GPG_TTY

# Config directories and files.
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export DOTREMINDERS=$XDG_CONFIG_HOME/reminders
export GHCUP_USE_XDG_DIRS=1
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export LYNX_CFG=$XDG_CONFIG_HOME/lynx/lynx.cfg
export LYNX_LSS=$XDG_CONFIG_HOME/lynx/lynx.lss
export PASSWORD_STORE_DIR=$XDG_CONFIG_HOME/password-store

alias mbsync='mbsync --config $XDG_CONFIG_HOME/mbsync/mbsyncrc'
alias abook='abook --datafile $XDG_CONFIG_HOME/abook/addressbook'

# Make applications aware of XMonad's non-reparenting property.
export _JAVA_AWT_WM_NONREPARENTING=1

# Neovim.
export EDITOR=nvim
alias vim=nvim

# Cargo.
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# GHCup.
if [ -f "$HOME/.local/share/ghcup/env" ]; then
  . "$HOME/.local/share/ghcup/env"
fi

# Aliases for bare repos.
# See https://www.atlassian.com/git/tutorials/dotfiles for more info.
alias pwstore='git --git-dir=$HOME/repos/pwstore/ --work-tree=$HOME'
alias dotfiles='git --git-dir=$HOME/repos/dotfiles/ --work-tree=$HOME'
alias private='git --git-dir=$HOME/repos/private/ --work-tree=$HOME'

# Print a calendar with reminders.
# Flags: Calendar to stdout (c) with Unicode lines (u) and 2-week length (+2),
#        Monday first column (m), 24-hour time format (b1)
# WARNING: If you want to be able to ssh into this machine, comment this out!
rem -cu+2mb1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Set history length.
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file rather than overwriting it.
shopt -s histappend

# Check the window size after each command and update LINES and COLUMNS.
shopt -s checkwinsize

# Set prompt based on the terminal's colour support.
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Enable colour support for ls and add colour-related aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.config/dircolors/dircolors && eval "$(dircolors -b ~/.config/dircolors/dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
fi

# Enable coloured GCC warnings and errors.
export GCC_COLORS='error=00;31:warning=00;35:note=00;36:caret=00;32:locus=00:quote=00'

