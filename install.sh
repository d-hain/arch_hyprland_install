#! /bin/sh

# Check for sudo privileges
if [ id -u -ne 0 ]
then
	echo "Please run as root."
	exit 1
fi



# Intro
echo "Install script for my hyprland setup on arch."
echo "Find my archinstall selections in the README.md of this repo. https://github.com/d-hain/arch_hyprland_install"
echo "\n"
echo "- Find me on github: https://github.com/d-hain"
echo "- hyprland: https://hyprland.org"
echo "- arch linux: https://archlinux.org"
echo "\n\n"



# Installing yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# Update system with yay
yay

# Installing all packages
yay -S \
	zsh alacritty \
	vim neovim \
	docker \
	virt-manager \
	sddm sddm-theme-corners-git \
	neofetch imv \
	exa btop bat ripgrep \
	brightnessctl pavucontrol bluez \
	waybar \
	swww hyprshot \
	synology-drive \
	filezilla \
	brave-bin \
	pinta \
	p3x-onenote-bin teams \
	ttf-jetbrains-mono ttf-jetbrains-mono-nerd \
	sl c-lolcat

# Installing Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Installing ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Change login shell to zsh
chsh -s $(which zsh) $(whoami)



# Configure git
echo "Configure git name and email? (y/n)"
read conf_git

if [ $conf_git -eq "y" ]
then
	git config --global user.name "David Hain"
	git config --global user.email "d.hain@gmx.at"
fi



# Copying config files from https://github.com/d-hain/dotfiles
git clone --recurse-submodules https://github.com/d-hain/dotfiles

mv ./dotfiles/.config ~/
mv ./dotfiles/.vimrc ~/
mv ./dotfiles/.zshrc ~/
mv ./dotfiles/.zsh_profile ~/

# rm -rf dotfiles