#!/bin/bash
#
# This is a library of logging functions that are used throughout the scripts
# in this project.
#
# I try to follow the google srcipt style guide.
# https://google.github.io/styleguide/shellguide.html
# I also use shellcheck to make sure that I am not using any bashisms.
# https://github.com/koalaman/shellcheck

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 1 ; pwd -P )"
source "$SCRIPTPATH"/color.sh

#######################################
# date - outputs date and time in a
# standard format. That format being
# Year.Month.Day-Hour:Minute:Seconds
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# Outputs:
#   outputs the date and time in a
#   standard format
#######################################
log::date(){
   echo $(date "+%Y.%m.%d-%H:%M:%S")
}

#######################################
# panic - logs message and exits 
#
# Arguments:
#  $*: message
#######################################
log::panic(){
    d=$(log::date)
    echo -e "${Red}[$d PANIC]:${Color_Off} $*" >&2
    exit 1
}

#######################################
# Err handling and logging
#
# Arguments:
#   $*: Error message
#######################################
log::err(){
    d=$(log::date)
    echo -e "${Red}[$d ERROR]:${Color_Off} $*" >&2
}

#######################################
# Info logging
#
# Arguments:
#   $*: Info message
#######################################
log::info(){
    d=$(log::date)
    echo -e "${Blue}[$d INFO]:${Color_Off} $*"
}

#######################################
# Debug logging
#
# Arguments:
#   $*: Debug message
######################################
log::debug(){
    if [[ "${DEBUG}" == "true" ]]; then
	d=$(log::date)
	echo -e "${Yellow}[$d DEBUG]:${Color_Off} $*"
    fi
}
