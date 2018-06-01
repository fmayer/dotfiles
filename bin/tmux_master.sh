#!/bin/bash

NOW=$(date -u +"%Y-%m-%dT%H%M%SZ")
tmux new-session -d -s main
tmux new-session -d -s $NOW -t main
tmux new-window -t $NOW -n $NOW
tmux attach-session -t $NOW
tmux kill-window -t $NOW
tmux kill-sesssion -t $NOW;
