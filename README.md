# Arch install with Hyprland

## Archinstall selections

**Language**:              English \
**Locales**:               Keyboard Layout: de \
**Disk config**:           btrfs, subvolumes, compression \
**Bootloader**:            Grub \
**Swap**:                  True \
**User account**:          dhain \
**Profile**:               None \
**Audio**:                 Pipewire \
**Additional packages**:
- git
- base-devel

**Network config**:        Use NetworkManager \
**Timezone**:              CEST \
**NTP**:                   True


## Packages (exluding archinstall extra packages)

- hyprland (window manager)
- xdg-desktop-portal-hyprland (xdg desktop portal for hyprland)
- zsh (shell)
- alacritty (terminal)
- neofetch (most important util)
- vim (for sudo editing needs)
- neovim (best editor)
- sddm (login manager)
- sddm-theme-corners-git (sddm theme)
- imv (terminal image viewer)
- exa (ls but with colors)
- btop (better than htop)
- bat (cat but beautiful)
- ripgrep (grep but better)
- brightnessctl (screen brightness utility)
- bluez (bluetooth utility)
- swww (wallpapers (including gifs))
- waybar (sidebar/taskbar)
- synology-drive (Synology Drive Client)
- docker (containers woooooooo)
- virt-manager (QEMU, WOW)
- filezilla (ftp file client)
- brave-bin (Chrome but better)
- hyprshot (screenshots)
- c-lolcat (lolcat (fast and without ruby! yay!))
- pinta (gimp but less features)
- p3x-onenote-bin (one note)
- teams (ms teams)
- swaylock (screen locker)
- wofi (app searcher)
- wlogout (logout/restart/shutdown utility)
- discord
- nautilus (file explorer)
- obsidian (note taking)
- pavucontrol (sound)
- ttf-jetbrains-mono (best font)
- ttf-jetbrains-mono-nerd (best font with icons)
- sl (ls)


## Installing

1. Download archiso, boot into the live environment and install arch. I'll be using archinstall.
1. Clone this repo and run the shell script. (aur helper will be yay)


## Other things to install

### ohmyzsh

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Plugins

##### zsh-autosuggestions

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

##### zsh-syntax-highlighting

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


## Things to configure

### Git config

```shell
git config --global user.name "David Hain"
git config --global user.email "d.hain@gmx.at"
```
