sudo pacman -Syyu git github-cli
sudo pacman -Sy gcc make i3status kitty less xorg-xinput firefox openssh

sudo # TODO: Remove this if no longer need to use obsidian
sudo pacman -Sy obsidian

sudo # Support bluetooth
sudo pacman -Sy bluez blueman bluez-utils

sudo # Zip/unzip files
sudo pacman -Sy zip unzip tar

sudo # TODO: Not sure if this is needed, should check
sudo pacman -Sy lxappearance-gtk3

sudo # Support background & transparency
sudo pacman -Sy feh picom

sudo pacman -Sy thunar

sudo # Image viewer
sudo pacman -Sy mupdf

sudo # Support neovim
sudo # TODO: Also install nvm and nodejs
sudo pacman -Sy neovim tmux lazygit ripgrep

sudo # installing sound controls
sudo pacman -Sy pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber pavucontrol

# required for polybar's codes
sudo pacman -Sy polybar xdotool wmctrl playerctl

# allow controlling screen's brightness
sudo pacman -Sy brightnessctl

# install timeshift backup tool and create a backup
sudo pacman -Sy timeshift
sudo timeshift --create
