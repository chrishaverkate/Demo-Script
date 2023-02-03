#!/bin/bash

BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ORANGE="\e[91m"
RESET="\e[0m"
CLEAR_LINE="\033[2K"

# setup echo and error catching
set -e
trap 'error_handler ${LINENO}' ERR

#===========================================================================
# Error handling functions
#===========================================================================
function print_fatal_error() {
	echo
	echo "##########################################################"
	echo "#  ERROR:" "$1"
	echo "##########################################################"
	echo
}

function error_handler() {
	local parent_lineno="$1"
	local message="$2"
	local code="${3:-1}"

	if [[ -n "$message" ]] ; then
		print_fatal_error "on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
	else
		print_fatal_error "on or near line ${parent_lineno}; exiting with status ${code}"
	fi

	exit "${code}"
}

#===========================================================================
# Printing Functions
#===========================================================================
#
# Clear the screen and print a new title
function print_title() {
	clear
	printf "${BOLD}********************************************${RESET}\n"
	printf "${BOLD}*  ${GREEN}$1${RESET}\n"
	printf "${BOLD}********************************************${RESET}\n\n"
}

#
# Print a simple message that will not clear the screen
function print_info() {
	printf "${BOLD}$1${RESET}\n"
}

#
# Print a finished banner to make it clear the demo is done
function print_finished() {
	clear
	printf "${BOLD}********************************************${RESET}\n"
	printf "${BOLD}*                   ${RED}Done${RESET}                   ${BOLD}*${RESET}\n"
	printf "${BOLD}********************************************${RESET}\n\n"
}

#===========================================================================
# Control Flow Functions
#===========================================================================
#
# Print a message indicating that the script is waiting for a key press
function wait() {
	printf "\n${BOLD}${ORANGE}Press any key to continue...${RESET}"
	read -rsp $'' -n1 key
	echo -e ${CLEAR_LINE}
}

#
# Run a command verbosely, by printing it to the screen
function run() {
	local x=0

	printf "${BOLD}${GREEN}+ ${RESET}"
	echo -e "\"$*\"\n"
	printf "${BOLD}${YELLOW}> ${RESET}"

	"$@" || x=$?

	if [[ "$x" -ne '0' ]]; then
		print_fatal_error "Running command \"$*\" failed with exit code $x"
	fi

	return $x
}

function print_questions() {
printf " ██████╗ ██╗   ██╗███████╗███████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗██████╗\n"
printf "██╔═══██╗██║   ██║██╔════╝██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝╚════██╗\n"
printf "██║   ██║██║   ██║█████╗  ███████╗   ██║   ██║██║   ██║██╔██╗ ██║███████╗  ▄███╔╝\n"
printf "██║▄▄ ██║██║   ██║██╔══╝  ╚════██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║  ▀▀══╝\n"
printf "╚██████╔╝╚██████╔╝███████╗███████║   ██║   ██║╚██████╔╝██║ ╚████║███████║  ██╗\n"
printf " ╚══▀▀═╝  ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝  ╚═╝\n"
}

print_questions

