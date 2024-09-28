mkdir -p ~/.config
cp -r ~/.config/nvim/ .config/
cp -r ~/.config/kitty/ .config/
cp -r ~/.config/i3/ .config/
cp -r ~/.config/i3status/ .config/
cp -r ~/.config/gtk-3.0/ .config/
cp -r ~/.tmux.conf ./

mkdir -p ~/.local/share
cp -r ~/.local/share/fonts/ .local/share/
cp -r ~/.local/share/themes/ .local/share/

git add .
git commit -m "Update dotfiles"
