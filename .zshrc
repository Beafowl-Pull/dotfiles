# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GPG_TTY=$(tty)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    sudo
    zsh-syntax-highlighting
    gpg-agent
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


## Beafowl conf

# Common use
alias grubup="sudo update-grub"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB
alias ohmyzsh='clion ~/.zshrc' # Open fish config in clion
alias norm='sh ~/Documents/Perso/coding-style-checker/coding-style.sh . . && cat ./coding-style-reports.log && rm -rf ./coding-style-reports.log' # Run coding style script
alias doc='cd ~/Documents'                         # Go to Documents
alias perso='cd ~/Documents/Perso'      # Go to Personal_Project
alias cppool='cd ~/Documents/B-PDG-300'            # Go to CPool
alias softwan='cd ~/Documents/Softwan'             # Go to Softwan
alias makefile='cp ~/Documents/Perso/Epitech-CPP-Template/Makefile .' # Makefile
alias oop='cd ~/Documents/oop/'			   # Go to oop
alias clean='make fclean'                          # Clean
alias re='make re'                                 # Re
alias gc='git clone'				   # git clone
alias make='make -j 16'				   # I m fast
alias cmak='cp ~/Documents/Perso/Epitech-CPP-Template/CMakeLists.txt .'
alias mat='cd ~/Documents/Maths'
alias up='sudo pacman -Syyuu'
alias k='kubectl'

# LS

alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
alias ip="ip -color"


# Intellij Idea

dockertek () {
    sudo docker run --rm -it -v $(pwd):/usr/src/project epitechcontent/epitest-docker /bin/bash -c 'cd /usr/src/project; exec bash' export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"
}

clion () {
    nohup /home/beafowl/.local/share/JetBrains/Toolbox/scripts/clion $1 &>/dev/null &
}

aqua () {
    nohup /home/beafowl/.local/share/JetBrains/Toolbox/scripts/aqua $1 &>/dev/null &
}

data () {
    nohup /home/beafowl/.local/share/JetBrains/Toolbox/scripts/dataspell $1 &>/dev/null &
}

idea () {
    nohup /home/beafowl/.local/share/JetBrains/Toolbox/scripts/idea $1 &>/dev/null &
}

py () {
    nohup /home/beafowl/.local/share/JetBrains/Toolbox/scripts/pycharm $1 &>/dev/null &
}

web () {
    nohup /home/beafowl/.local/share/JetBrains/Toolbox/scripts/webstorm $1 &>/dev/null &
}

dolphin() {
    nohup /usr/bin/dolphin $1 &>/dev/null &
}

cmakerm () {
    make clean
    if [[ "$1" == "--recursive" || "$1" == "-r" ]]; then
        rm -rf $(find -name "*-prefix" -o -name "CMakeFiles" -o -name "CMakeCache.txt" -o -name "cmake_install.cmake" -o -name "Makefile" -o -name "Testing" -o -name ".cmake" -o -name "*.cbp")
    else
        rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile cmake-build-debug Testing CMake .cmake *.cbp
    fi
}

build () {
    if [ "$1" ]; then
        cmake -S $path -B $path/build && cmake --build $path/build -j
    else
        cmake -S . -B ./build && cmake --build ./build -j
    fi
}

push () {
    if [ "$1" ]; then
        git add $1 && git commit && git push
    else
        git add . && git commit && git push
    fi
}

changenamespace() {
    kubectl config set-context --current --namespace=$1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/home/beafowl/.ghcup/env" ] && source "/home/beafowl/.ghcup/env" # ghcup-env
wal -n -R
clear
fastfetch
