# save the current directory
current_dir=$(pwd)

# get current file path and cd to the directory
cd "$(dirname "$0")"

# copy the dotfiles to the current directory
cp -r .local ~/
cp -r .config ~/
cp .tmux.conf ~/
cp .bashrc ~/

cp -r backgrounds/ ~/

chmod 755 ~/.local/bin/*

sudo cp etc/systemd/system/lockscreen.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable lockscreen.service

cd $current_dir
