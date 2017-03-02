# vim: set ts=4:
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Clear aliases so that ". .profile" doesn't run afoul of "alias cp='cp -i'"
# and others set near the end of .bashrc.
unalias -a

# customize PATH
PATH="$HOME/bin:$HOME/apoe4it/bin:$PATH:."

stty kill ^x

if [ -n "$XENVIRONMENT" ]; then
	XENVIRONMENT=$HOME/.Xdefaults-$(choose-xdefaults)
	export XENVIRONMENT
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
