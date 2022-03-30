#!/bin/bash

# Assuming the linux kaspad zip file was extracted in /usr/local/kaspa
# Assuming this script is in /usr/local/kaspa
#
# chown 755 start-kaspad.sh
#
# Add the following line to your crontab  (without the #)
# * * * * * /usr/local/kaspa/start-kaspad.sh
#
# The script should launch kaspad in a minute or two after booting up
#
# to connect to the tmux session
#  tmux at -t kaspa



SESSION="kaspa"

if ! tmux has-session -t $SESSION 2>/dev/null; then
    # tmux new-session -s kaspad bash "/usr/local/kaspa/bin/kaspad"
        /usr/bin/tmux new-session -d -s $SESSION
        /usr/bin/tmux send-keys -t $SESSION.0 "cd /usr/local/kaspa/bin" C-m
        /usr/bin/tmux send-keys -t $SESSION.0 "./kaspad" C-m
        /usr/bin/tmux send-keys -t $SESSION.0 "exit" C-m
fi
