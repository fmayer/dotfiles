#!/bin/bash

NOW=$(date -u +"%Y-%m-%dT%H%M%SZ")

echo -ne "\033]0;Terminal $NOW\007"

function finish {
tmux kill-window -t $NOW
tmux kill-session -t $NOW;
}
trap finish EXIT

tmux new-session -d -s main
tmux new-session -d -s $NOW -t main
tmux new-window -t $NOW -n $NOW
tmux attach-session -t $NOW
