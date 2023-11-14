#!/bin/sh

. "$HOME/.bashrc.d/sources.sh"
. "$HOME/.bashrc.d/functions.sh"

# Make sure the sources.sh are loaded first.
# Otherwise some packages won't be found.
. "$HOME/.bashrc.d/aliases.sh"

# Check if we are running a kitty terminal.
# If so, source kitty.sh
if [ "$TERM" = "xterm-kitty" ]; then
    . "$HOME/.bashrc.d/kitty.sh"
fi

export EDITOR=nvim
