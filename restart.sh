#!/usr/bin/env sh
# We need to use sh, since it's hardcoded in spigot
# Doesn't matter much, since it doesn't do much anyway

# This script only creates a file which tells `start.sh` that it should restart, instead of exiting.

# Make sure to change this, if you modified `restart_flag` in `start.sh`!
touch .restart_flag
