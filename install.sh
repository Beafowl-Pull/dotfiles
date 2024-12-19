#!/usr/bin/env bash

install-yay() {
  sudo pacman -S --needed --noconfirm base-devel
  git clone https://aur.archlinux.org/yay-bin.git /tmp/buildyay
  cd /tmp/buildyay
  makepkg -o
  makepkg -se
  makepkg -i --noconfirm
  cd $base
  rm -rf /tmp/buildyay
}

install-requirements() {
  sudo pacman -Syyuu
  sudo pacman -S pipewire libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl swww python gnome-bluetooth-3.0 pacman-contrib power-profiles-daemon gvfs
  sudo pacman -S git kitty firefox zsh alacritty thunar tumbler discord htop cmake python-pywal sxiv unzip wpgtk nwg-look
  yay -S grimblast-git gpu-screen-recorder hyprpicker matugen-bin python-gpustat aylurs-gtk-shell-git hyprsunset-git hypridle-git lens-bin jetbrains-toolbox spotify visual-studio-code-bin python-pywalfox pywal-discord-git spicetify-cli
}

install-better-discord() {
  curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
  chmod +x betterdiscordctl
  sudo mv betterdiscordctl /usr/local/bin
}

install-zsh-requirements() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install-rofi-requirements() {
  git clone --depth=1 https://github.com/adi1090x/rofi.git
  cd rofi
  chmod +x setup.sh
  ./setup.sh
}

copy-dotfiles() {
  cp -r Pictures .config .p10k.zsh .zshrc ~/
}

install-spotify-theme() {
  git clone https://github.com/Comfy-Themes/Spicetify
  cd Spicetify
  ./install.sh
}

init-some-stuff() {
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

install-ags-theme() {
  git clone https://github.com/Jas-SinghFSU/HyprPanel.git ~/Documents && ln -s $(pwd)/HyprPanel $HOME/.config/ags
}

install-sddm-theme() {
  sudo pacman -S qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm
  sudo git clone https://github.com/keyitdev/sddm-flower-theme.git /usr/share/sddm/themes/sddm-flower-theme
  sudo cp /usr/share/sddm/themes/sddm-flower-theme/Fonts/* /usr/share/fonts/
  echo "[Theme]
  Current=sddm-flower-theme" | sudo tee /etc/sddm.conf
}

install-yay()
install-requirements()
install-better-discord()
install-zsh-requirements()
install-rofi-requirements()
install-spotify-theme()
install-ags-theme()
install-sddm-theme()
copy-dotfiles()
init-some-stuff()
sudo systemctl enable nvidia-hibernate nvidia-suspend nvidia-resume
sudo systemctl enable sddm
sudo systemctl start sddm
