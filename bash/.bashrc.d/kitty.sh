#!/bin/sh

# Test if the current terminal is `kitty`.
if [ "$TERM" = "xterm-kitty" ]; then
    alias icat="kitty +kitten icat"
    alias ssh="kitty +kitten ssh"
fi
