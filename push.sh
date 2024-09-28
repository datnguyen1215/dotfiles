# get current file path and cd to the directory
cd "$(dirname "$0")"

mkdir -p ./.config/
cp -r ~/.config/nvim/ .config/
cp -r ~/.config/kitty/ .config/
cp -r ~/.config/i3/ .config/
cp -r ~/.config/gtk-3.0/ .config/
cp -r ~/.tmux.conf ./
cp -r ~/.bashrc ./

mkdir -p ./.local/share/
cp -r ~/.local/share/fonts/ .local/share/
cp -r ~/.local/share/themes/ .local/share/

git add .
git commit -m "Update dotfiles"
