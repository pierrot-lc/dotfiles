#!/bin/bash

#############################################
# Show a quick cheatsheet of a shell command.
# ARGUMENTS:
#   Command to search for.
#############################################
function idk() {
    curl "cheat.sh/$1"
}


#############################################
# Activate a python virtual environment.
#
# Do a recursive search upward until a
# virtual environment is found.
# The virtual env directory has to be named
# `venv` otherwise it will not be found!
#
# ARGUMENTS:
#   The directory to search for.
#       Optional, `pwd` by default.
#############################################
function pva() {
    if [ -d "$1" ]; then
        root="$1"
    else
        root="$(pwd)"
    fi

    if [ -f "$root/.venv/bin/activate" ]; then
        . "$root/.venv/bin/activate"
    else
        if [[ "$root" == '/' ]]; then
            # We've hit root, we can't search further.
            echo "Could not find Python '.venv' Activate file!" >&2
            return 1
        else
            pva "$(dirname "${root}")"
        fi
    fi
}


#############################################
# Create and activate a python virtual
# environment.
#
# The name of the environment will be `venv`.
# The path where the env is created is
# determined by the following priority:
# 1) The provided path.
# 2) A git root if any.
# 3) The current working directory.
#
# ARGUMENTS:
#   The directory to search for (optional).
#   --version: The version of python to use.
#       Optional, `3` by default.
#############################################
function pvc() {
    version="3"
    # TODO: Find how to select the version using --version.
    # if [ $# -eq 1 ]; then
    #     version="${1}"
    # fi

    # Deactivate existing first!
    if [ -d "$VIRTUAL_ENV" ] && type deactivate > /dev/null 2>&1; then
        deactivate
    fi

    git_root="$(git rev-parse --show-toplevel 2> /dev/null)"
    if [ -d "$1" ]; then
        # Use provided path.
        root="$1"
    elif [ -d "$git_root" ]; then
        # Use git root path.
        root="$git_root"
    else
        # Use working directory.
        root="$(pwd)"
    fi

    env_root="$root/.venv"
    echo "Creating env at $env_root..."
    if [ -d "$env_root" ]; then
        rm -r "$env_root"
    fi

    python"$version" -m venv "$env_root"
    . "$env_root/bin/activate"

    echo "Done!"
}
