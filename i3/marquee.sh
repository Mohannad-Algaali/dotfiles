#!/bin/bash

message="  Your scrolling message here!  "
# Get terminal width if possible, default to 80 characters
cols=$(tput cols || echo 80)
msg_len=${#message}

while true; do
  for i in $(seq 0 $((msg_len + cols))); do
    # Create the scrolling effect
    # The printf "\r" moves the cursor to the start of the line
    # The printf "%*s" creates leading spaces for the 'scrolling'
    printf "\r%*s" "$i" ""
    # Print a substring of the message starting from the appropriate index
    printf "%s" "${message:i-cols:cols}"
    # Small delay for animation speed
    sleep 0.1
  done
done
