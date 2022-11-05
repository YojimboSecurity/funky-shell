#!/bin/bash
#
# This is a library of common functions that are used throughout the scripts
# in this project.
#
# I try to follow the google srcipt style guide.
# https://google.github.io/styleguide/shellguide.html
# I also use shellcheck to make sure that I am not using any bashisms.
# https://github.com/koalaman/shellcheck

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 1 ; pwd -P )"
source "$SCRIPTPATH"/logging.sh

#######################################
# find_file is a wrapper around find
# and loops over find in a safe way and
# outputs the results. Refer to
# https://www.shellcheck.net/wiki/SC2044
#
# This function is primarily used as an
# example and reference.
# 
# Globals:
#   None
# Arguments:
#   $1 - directory to search
#   $2 - find options
#   $3 - function to do work in the loop.
#        This function needs to take the
#        file as an argument
# Returns:
#   None
# Outputs:
#   outputs the results of find
#######################################
common::find_file(){
  local dir="$1"
  local search="$2"
  local func=$3
  log::debug "dir:$dir search:$search"
  while IFS= read -r -d '' file
  do
    # do something with "$file" here
    log::debug "$file"
    $func "$file"
  done < <(find "$dir" -type f -iname "$search" -print0)
}
