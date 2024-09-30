#!/bin/bash

# Check if the correct number of arguments are provided
if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <workspace_offset>"
	exit 1
fi

TARGET_WORKSPACE=$1

# Get the current workspace name
CURRENT_WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# if current workspace is > 10, we need to add 10 into target workspace number
if ((CURRENT_WORKSPACE > 10)); then
	TARGET_WORKSPACE=$((TARGET_WORKSPACE + 10))
fi

# Generate the target workspace name (adapt if you use named workspaces differently)
# Here, it is assumed workspace names are numeric, e.g., "1", "2", "3", ...
# If you use named workspaces, you might need additional logic to handle the names

# Move the active window to the target workspace
i3-msg move container to workspace number $TARGET_WORKSPACE

echo "Moved active window to workspace $TARGET_WORKSPACE"
