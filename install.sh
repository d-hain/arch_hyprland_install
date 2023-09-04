#! /bin/sh

# Check for sudo privileges
if [[ $EUID -ne 0 ]]; then
	echo "Please run as root."
	exit 1
fi

# Username has to be given as an argument
if [[ $# -lt 1 ]]; then
    echo "The first argument passed to the scipt should be your username."
    exit 1
fi
username=$1


# Intro
echo "Install script for my hyprland setup on arch."
echo "Find my archinstall selections in the README.md of this repo. https://github.com/d-hain/arch_hyprland_install"
echo
echo "- Find me on github: https://github.com/d-hain"
echo "- hyprland: https://hyprland.org"
echo "- arch linux: https://archlinux.org"
echo
echo


# Installing yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
chmod 777 yay-bin
cd yay-bin
sudo -u $username makepkg -si

# Update system with yay
yay

# Installing Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Installing all packages
yay -S \
	zsh alacritty \
	vim neovim \
	hyprland xdg-desktop-portal-hyprland \
	docker \
	virt-manager \
	sddm \
	neofetch imv \
	exa btop bat ripgrep \
	brightnessctl pavucontrol bluez \
	waybar wofi \
	discord \
	nautilus filezilla libreoffice-still \
	pinta \
	ttf-jetbrains-mono ttf-jetbrains-mono-nerd \
	sl

# These have to be installed without sudo
sudo -u $username yay -S \
 	c-lolcat \
 	sddm-theme-corners-git \
 	swww hyprshot swaylock-effects wlogout \
 	jetbrains-toolbox postman-bin balena-etcher \
 	brave-bin \
 	synology-drive \
 	p3x-onenote-bin teams \
 	oh-my-zsh-git

# Installing ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Configure git
echo "Configure git name and email? (y/n)"
read conf_git

if [[ $conf_git -eq "y" ]]; then
	git config --global user.name "David Hain"
	git config --global user.email "d.hain@gmx.at"
fi


# Copying config files from https://github.com/d-hain/dotfiles
git clone --recurse-submodules https://github.com/d-hain/dotfiles

# .config
mv ./dotfiles/.config/alacritty ~/.config/alacritty
mv ./dotfiles/.config/hypr ~/.config/hypr
mv ./dotfiles/.config/nvim ~/.config/nvim
mv ./dotfiles/.config/swaylock ~/.config/swaylock
mv ./dotfiles/.config/wofi ~/.config/wofi

mv ./dotfiles/.vimrc ~/
mv ./dotfiles/.zshrc ~/
mv ./dotfiles/.zsh_profile ~/

source ~/.zshrc