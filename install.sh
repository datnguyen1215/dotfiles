# save the current directory
current_dir=$(pwd)

# get current file path and cd to the directory
cd "$(dirname "$0")"

# copy the dotfiles to the current directory
cp -r .local ~/
cp -r .config ~/
cp .tmux.conf ~/

sudo cp -r etc/ /etc/

chmod 755 ~/.local/bin/*

cd $current_dir
