#############################################
# Show a quick cheatsheet of a shell command.
# ARGUMENTS:
#   Command to search for.
#############################################
function idk() {
    curl "cheat.sh/$1"
}

# Some aliases to use only if the current terminal is kitty.
if [ "$TERM" = "xterm-kitty" ]; then
    alias icat="kitty +kitten icat"
    alias ssh="kitty +kitten ssh"
fi
