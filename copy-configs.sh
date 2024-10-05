current_dir=$(pwd)

cd "$(dirname "$0")"

rm -rf .config/*
mkdir -p .config/
cp -r ~/.config/nvim/ .config/
cp -r ~/.config/kitty/ .config/
cp -r ~/.config/gtk-3.0/ .config/
cp -r ~/.config/polybar/ .config/
cp -r ~/.config/picom/ .config/
cp -r ~/.config/qtile/ .config/
cp -r ~/.tmux.conf ./
cp -r ~/.bashrc ./

rm -rf .local/*
mkdir -p .local/share/
mkdir -p .local/bin/
cp -r ~/.local/share/fonts/ .local/share/
cp -r ~/.local/share/themes/ .local/share/
cp -r ~/.local/bin/ .local/

cp -r ~/backgrounds/ ./

cd $current_dir
