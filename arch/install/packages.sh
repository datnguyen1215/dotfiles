sudo pacman -Syu git github-cli
sudo pacman -S openssh kitty less
sudo pacman -S networkmanager nm-connection-editor network-manager-applet
sudo pacman -S lightdm i3 i3status
sudo pacman -S xorg-xinput
sudo pacman -S dmenu firefox

sudo # TODO: Remove this if no longer need to use obsidian
sudo pacman -Syu obsidian

sudo # Support bluetooth
sudo pacman -S bluez blueman bluez-utils

sudo # Zip/unzip files
sudo pacman -S zip unzip tar

sudo # TODO: Not sure if this is needed, should check
sudo pacman -S lxappearance-gtk3

sudo # Support background & transparency
sudo pacman -S feh picom

sudo pacman -S thunar

sudo # Image viewer
sudo pacman -S mupdf

sudo # Support neovim
sudo # TODO: Also install nvm and nodejs
sudo pacman -S neovim tmux lazygit ripgrep

sudo # installing sound controls
sudo pacman -S pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber pavucontrol

# install timeshift backup tool and create a backup
sudo pacman -S timeshift
sudo timeshift --create
