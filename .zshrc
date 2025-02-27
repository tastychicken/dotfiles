# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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
plugins=(git tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_UNICODE=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

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

# jari conf
alias vi='nvim'
alias fucking='sudo'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias i='rm -rf node_modules/ && time npm install'
alias tmux-layout='~/.local/bin/tmux-layout.sh'
alias tl='tmux-layout'
alias tls='tmux list-sessions'
alias get-local-ip='ip a | grep wlp0s20f3'
alias pg='sudo service postgresql@16-main start'

# get playlist uri by hovering over share meny and holding ALT
alias its-friday='~/.local/bin/play-spotify-playlist.sh spotify:playlist:2hxfAM03amMsLTVgEQwz6K'

# http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
# no = NORMAL/DEFAULT
# di = Directory, ow = Other Writeable, st = Sticky, tw = Sticky Writeable
# fi = File, ex = Executable, ln = Link
LS_COLORS='no=00;37:di=02;40:ow=00;41:st=00;41:tw=00;41:fi=00;97:ex=31;37:ln=04;37:pi=00;35:do=00;31:bd=00;32:cd=00;32:or=00;32:so=00;32:su=00;35:sg=00;35'

# nvm conf
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# functions
alias get-cert-fp="get_cert_fingerprint"
get_cert_fingerprint () {
  file=${1}
  openssl x509 -fingerprint -in $file -noout | sed "s/^.\{17\}//g" | sed "s/://g"
}

alias get-cert-pk="get_cert_privatekey"
get_cert_privatekey () {
  file=${1}
  openssl pkcs12 -in $file -nocerts -nodes | tail -n +8 | awk -v ORS='\\n' '1' | sed "s/.\{2\}$//"; echo
}

alias db-tunnel="db_tunnel"
db_tunnel () {
        db_tunnel_pid=$(pgrep -o -f "ssh -N -f -L 1337:localhost:5432 pds-postgres")
        if [[ -n $db_tunnel_pid ]]
        then
                echo "resetting db-tunnel"
                kill $db_tunnel_pid
        fi
        ssh -N -f -L 1337:localhost:5432 pds-postgres
}

# neovim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# sudo mv squashfs-root /
# sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

eval `ssh-agent -s` &> /dev/null
autoload -U compinit; compinit
