#! /bin/sh

# Do not run this script using sudo
if [[ $EUID -eq 0 ]]; then
	echo "Please do not run using sudo!"
	exit 1
fi

# Username has to be given as an argument
if [[ $# -lt 1 ]]; then
    echo "The first argument passed to the scipt should be your username."
    exit 1
fi
username=$1
homedir=/home/$username


# Intro
echo "Install script for my hyprland setup on arch."
echo "Find my archinstall selections in the README.md of this repo. https://github.com/d-hain/arch_hyprland_install"
echo
echo "- Find me on github: https://github.com/d-hain"
echo "- hyprland: https://hyprland.org"
echo "- arch linux: https://archlinux.org"
echo
echo "Press any button to install..."
read _button


# Installing yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
chmod 777 yay-bin
cd yay-bin
makepkg -si
cd ..

# Update system with yay
yay


# Installing all packages
yay -S \
	rustup \
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
yay -S \
 	c-lolcat \
 	swww hyprshot swaylock-effects wlogout \
 	jetbrains-toolbox postman-bin \
 	brave-bin \
 	synology-drive \
 	p3x-onenote-bin teams \
 	oh-my-zsh-git

# Catpuccin SDDM Theme
# Dependencies
yay -S qt5-graphicaleffects qt5-svg qt5-quickcontrols2

git clone https://github.com/catpuccin/sddm
sudo cp -r src/catpuccin-macchiato /usr/share/sddm/themes/
sudo echo "[Theme]\nCurrent=catpuccin-macchiato\n" > /etc/sddm.conf

# Installing ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# Installing packer (nvim package manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim $homedir/.local/share/nvim/site/pack/packer/start/packer.nvim


# Configure git
echo "Configure git name and email? (y/n)"
read conf_git

if [[ $conf_git -eq "y" ]]; then
	git config --global user.name "David Hain"
	git config --global user.email "d.hain@gmx.at"

	echo "git config done."
fi


# Copying config files from https://github.com/d-hain/dotfiles
git clone --recurse-submodules https://github.com/d-hain/dotfiles

workdir=$(pwd)

# .config
sudo mv $workdir/dotfiles/.config/alacritty   $homedir/.config/alacritty
sudo mv $workdir/dotfiles/.config/hypr        $homedir/.config/hypr
sudo mv $workdir/dotfiles/.config/nvim        $homedir/.config/nvim
sudo mv $workdir/dotfiles/.config/swaylock    $homedir/.config/swaylock
sudo mv $workdir/dotfiles/.config/wofi        $homedir/.config/wofi

sudo mv $workdir/dotfiles/.vimrc              $homedir/
sudo mv $workdir/dotfiles/.zshrc              $homedir/
sudo mv $workdir/dotfiles/.zsh_profile        $homedir/


# Enabling startup things
systemctl enable sddm.service


# Sexy ending
clear
neofetch
