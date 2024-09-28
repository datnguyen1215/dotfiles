pacman -Syu git github-cli
pacman -S openssh kitty less
pacman -S networkmanager nm-connection-editor network-manager-applet
pacman -S lightdm i3 i3status
pacman -S xorg-xinput
pacman -S dmenu firefox

# TODO: Remove this if no longer need to use obsidian
pacman -Syu obsidian

# Support bluetooth
pacman -S bluez blueman bluez-utils

# Zip/unzip files
pacman -S zip unzip tar

# TODO: Not sure if this is needed, should check
pacman -S lxappearance-gtk3

# Support background & transparency
pacman -S feh picom

pacman -S thunar

# Image viewer
pacman -S mupdf

# Support neovim
# TODO: Also install nvm and nodejs
pacman -S neovim tmux lazygit ripgrep

# installing sound controls
pacman -S pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber pavucontrol
