current_dir=$(pwd)

cd "$(dirname "$0")"

rm -rf .config/*
mkdir -p .config/
cp -r ~/.config/nvim/ .config/
cp -r ~/.config/kitty/ .config/
cp -r ~/.config/i3/ .config/
cp -r ~/.config/gtk-3.0/ .config/
cp -r ~/.config/polybar/ .config/
cp -r ~/.tmux.conf ./
cp -r ~/.bashrc ./

rm -rf .local/*
mkdir -p .local/share/
mkdir -p .local/bin/
cp -r ~/.local/share/fonts/ .local/share/
cp -r ~/.local/share/themes/ .local/share/
cp -r ~/.local/bin/ .local/

mkdir -p etc/
cp -r /etc/timeshift etc/

# commit changes
git add .
git commit -m "Update dotfiles"

cd $current_dir
