#!/bin/bash

#==============================================================================
# Example of how to use the above functions
#
# print_title:    Use to clear the screen and show a title of what you're
#                 going to talk about. Great for titling a sequence of related
#                 commands, as well as clearing the screen and starting a new
#                 topic.
#
# wait:           Pauses the flow of the script and waits for a key press.
#                 Provides time to talk about what just happened or is about
#                 to happen.
#
# print_info:     Prints a string in a bold way. Useful as a "subtitle".
#
# run:            Prefix any command with 'run' and it will verbosely print
#                 the command as well as run it with error handling.
#
# print_finished: Clears the screen and prints a clear message that the demo
#                 is complete. Helpful so people know there are no more
#                 commands to run.
#==============================================================================

# Get the directory of the script and include the demo-utils.bash.
# If you move this script anywhere, the 'source' command will fail; unless updated.
script_dir="$(builtin cd "$(dirname "$0")" && pwd -P)"
source "$script_dir/demo-utils.bash"

print_title "Welcome to my demo script!"
wait

print_title "The date command"
print_info 'The date command is a powerful and flexible way to get dates and times!'
wait

print_info '1. Getting current time'
run date
wait

print_info '2. What about just the year?'
run date "+%Y"
wait

print_info '3. As a timestamp?'
run date +"%Y%m%d%H%M%S"
wait

print_finished
print_questions
wait

