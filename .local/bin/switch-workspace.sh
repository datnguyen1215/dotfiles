#!/bin/bash

# $1 comes in form of "1" or "2" etc.
# convert to integer
TARGET_WORKSPACE_1=$((0 + $1))
TARGET_WORKSPACE_2=$(($TARGET_WORKSPACE_1 + 10))

# Get focused workspace
FOCUSED_WORKSPACE=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | tr -d '"')

# Switch to target workspace
i3-msg workspace $TARGET_WORKSPACE_1
i3-msg workspace $TARGET_WORKSPACE_2

# if focused_workspace > 10, switch to target 2
if [ $FOCUSED_WORKSPACE -gt 10 ]; then
	i3-msg workspace $TARGET_WORKSPACE_2
else
	i3-msg workspace $TARGET_WORKSPACE_1
fi
