
alias ftpgo="ls /home/khairi/Languages/Go/FTPServer/*.go /home/khairi/Languages/Go/FTPServer/ftp/*.go | entr -r sh -c \"echo '\n\n' rm /home/khairi/Languages/Go/FTPServer/main && go build /home/khairi/Languages/Go/FTPServer/main.go && /home/khairi/Languages/Go/FTPServer/main\""
alias helix="~/.cargo/bin/hx"
alias gpt="./.config/chatgpt/chatgpt.sh"

alias gotour="/home/khairi/go/bin/tour --http 127.0.0.1:9999"
alias mango="go run main.go"
export GO111MODULE=on
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin


if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 0)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi


sanchoman="( ._.)"
right_prompt() 
{
  local e=$(tput cols)
  time="[$(date +%H:%M)]"
  tput cup 0 "$(($e-${#time}))"
  echo $time
}



echo "$MAGENTA$BOLD$sanchoman$RESET$(right_prompt)"
function wipe() {
  clear && echo "$MAGENTA$BOLD$sanchoman$RESET$(right_prompt)"
}

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH=/home/khairi/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
#OSH_THEME="brainy"
OSH_THEME="sexy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _dotnet_bash_complete dotnet


# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: 
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"


#thefuck
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
alias fuck="FUCK"

#open files
alias open="xdg-open"

#refresh after cd
function ccd(){
  cd "$@" && wipe
}

#create and cd into new directory
function cdir(){
  mkdir "$@" && ccd "$@"
}

#latex previewer
function betch(){
  latexmk -pdf -pvc "$@"
}

#ls after cd
function clsd(){
  ccd "$@" && ls
}

#cleanup after open
function copen(){
  open "$@" && wipe
  echo ":opened: $@"
}

#exec cpp file
function execpp(){
  if [ -z "$@" ]
    then
      g++ -std=c++17 ./main.cpp -o a.out && ./a.out
  else
      g++ -std=c++17 ./"$@".cpp -o a.out && ./a.out
  fi

}

#exec cpp file + mem leaks check
function memcpp(){

  if [ -z "$@" ]
    then
      g++ -ggdb3 -std=c++17 ./main.cpp -o a.out
  else
      g++ -ggdb3 -std=c++17 ./"$@".cpp -o a.out
  fi 

  valgrind --leak-check=yes ./a.out
}



#killall jobs
alias gotohell="kill \$(jobs -p)"

#Latom
alias latom="ccd /home/khairi/Latom/latom && python main.py"
. "$HOME/.cargo/env"

#zathura
alias padura="zathura --fork && exit"

#sudo
alias fucking="sudo"

#c-hashtag
alias cs="clear && dotnet run"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
