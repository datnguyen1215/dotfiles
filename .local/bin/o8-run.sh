PROJECT_PATH=~/work/projects/o8/

tmux rename-window 'o8-run'
tmux split-pane -h -t :.1
tmux split-pane -v -t :.1
tmux split-pane -v -t :.3
tmux split-pane -v -t :.3

tmux send-keys -t :.1 "cd $PROJECT_PATH/backend" C-m
tmux send-keys -t :.1 "npm run dev" C-m

tmux send-keys -t :.2 "cd $PROJECT_PATH/frontend" C-m
tmux send-keys -t :.2 "npm run dev" C-m

tmux send-keys -t :.3 "cd $PROJECT_PATH/extensions" C-m
tmux send-keys -t :.3 "npm run watch" C-m

tmux send-keys -t :.4 "cd $PROJECT_PATH/extensions/src/pages" C-m
tmux send-keys -t :.4 "npm run dev" C-m

tmux send-keys -t :.5 "cd $PROJECT_PATH/webapp" C-m
tmux send-keys -t :.5 "npm run dev" C-m
