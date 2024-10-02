#!/bin/bash
export PROJECT_PATH=~/personal/projects/webhooks/

tmux rename-window 'webhooks'
tmux split-pane -v -t :.1

tmux send-keys -t :.1 "cd $PROJECT_PATH" C-m
tmux send-keys -t :.1 'npm run dev' C-m

tmux send-keys -t :.2 'ngrok http 9500 --url living-ready-glider.ngrok-free.app' C-m
