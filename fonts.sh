mkdir -p ~/.local/share/fonts/nerd
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/BitstreamVeraSansMono.zip -P /tmp/
unzip /tmp/BitstreamVeraSansMono.zip -d ~/.local/share/fonts/nerd/BitsreamVeraSansMono
fc-cache -f -v
