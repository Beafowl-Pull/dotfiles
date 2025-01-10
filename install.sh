#!/usr/bin/env bash

export script_path=$(pwd)
echo $script_path

install_yay() {
  sudo pacman -S --needed --noconfirm base-devel
  git clone https://aur.archlinux.org/yay-bin.git /tmp/buildyay
  cd /tmp/buildyay
  makepkg -o
  makepkg -se
  makepkg -i --noconfirm
  cd $script_path
  rm -rf /tmp/buildyay
}

install_requirements() {
  sudo pacman -Syyuu --noconfirm
  sudo pacman -S pipewire libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl swww python gnome-bluetooth-3.0 pacman-contrib power-profiles-daemon gvfs
  sudo pacman -S kitty firefox zsh alacritty thunar tumbler discord htop cmake python-pywal sxiv unzip nwg-look --noconfirm
  yay -S grimblast-git gpu-screen-recorder hyprland-git hyprpicker-git matugen-bin python-gpustat aylurs-gtk-shell-git hyprsunset-git hypridle-git lens-bin jetbrains-toolbox spotify visual-studio-code-bin python-pywalfox pywal-discord-git spicetify-cli wpgtk --noconfirm
}

install_better_discord() {
  curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
  chmod +x betterdiscordctl
  sudo mv betterdiscordctl /usr/local/bin
}

install_zsh_requirements() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_rofi_requirements() {
  git clone --depth=1 https://github.com/adi1090x/rofi.git
  chmod +x $(pwd)/rofi/setup.sh
  cd rofi
  ./setup.sh
  cd $script_path
}

copy_dotfiles() {
  cp -r $(pwd)/Pictures $(pwd)/.config $(pwd)/.p10k.zsh $(pwd)/.zshrc ~/
}

install_spotify_theme() {
  sudo chmod a+wr /opt/spotify
  sudo chmod a+wr /opt/spotify/Apps -R    
  git clone https://github.com/Comfy-Themes/Spicetify
  cd Spicetify
  ./install.sh
  cd $script_path
}

init_some_stuff() {
  swww img ~/Pictures/wallpaper.png
  wal -n -i ~/Pictures/$img
  sh ~/.config/hypr/scripts/changecolorsrofi.sh
  sh ~/.config/hypr/scripts/changecolorspowermenu.sh
  sh ~/.config/hypr/scripts/changecolorsspotify.sh
  spicetify refresh
  /usr/bin/wpg-install.sh -G
  betterdiscordctl install
  pywal-discord
}

install_ags_theme() {
  git clone https://github.com/Jas-SinghFSU/HyprPanel.git ~/Documents/HyprPanel && ln -s ~/Documents/HyprPanel $HOME/.config/ags
}

install_sddm_theme() {
  sudo pacman -S qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm --noconfirm
  sudo git clone https://github.com/keyitdev/sddm-flower-theme.git /usr/share/sddm/themes/sddm-flower-theme
  sudo cp /usr/share/sddm/themes/sddm-flower-theme/Fonts/* /usr/share/fonts/
  echo "[Theme]
  Current=sddm-flower-theme" | sudo tee /etc/sddm.conf
}

# Call the functions in sequence
#install_yay
#install_requirements
#install_better_discord
#install_zsh_requirements
#install_rofi_requirements
#install_spotify_theme
install_ags_theme
#install_sddm_theme
#copy_dotfiles
#init_some_stuff

# Enable and start systemd services
#sudo systemctl enable nvidia-hibernate nvidia-suspend nvidia-resume
#sudo systemctl enable sddm
#sudo systemctl start sddm
