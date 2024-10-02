#!/bin/bash

tmux rename-window notes
tmux send-keys 'nvim ~/vaults/notes/' C-m
