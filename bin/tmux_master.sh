#!/bin/bash

NOW=$(date -u +"%Y-%m-%dT%H%M%SZ")
MASTER_SESSION="main-$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name'  | cut -d"\"" -f2)"

echo -ne "\033]0;Terminal $NOW\007"

function finish {
tmux kill-window -t $NOW
tmux kill-session -t $NOW;
}
trap finish EXIT

tmux new-session -d -s $MASTER_SESSION
tmux new-session -d -s $NOW -t $MASTER_SESSION
tmux new-window -t $NOW -n $NOW
tmux attach-session -t $NOW
