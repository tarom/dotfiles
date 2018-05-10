# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:$HOME/go/bin
export TERM=xterm-256color
export SHELL=/usr/local/bin/zsh

#### completion ####
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#### completion end ####

#### for history ####
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
####

#### spaceship zsh theme ####
SPACESHIP_CHAR_SYMBOL="> "
SPACESHIP_TIME_SHOW=true
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
####

### Zplug ###
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Packages
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug 'denysdovhan/spaceship-zsh-theme', use:spaceship.zsh, from:github, as:theme
### Zplug End ###

alias vim="reattach-to-user-namespace nvim"
alias vi="reattach-to-user-namespace nvim"
alias ls="ls -FG"
alias dcex="docker-compose exec"
alias fig="docker-compose"

eval "$(direnv hook zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# PHP Brew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

zplug load

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc
