# General
export LANG=ja_JP.UTF-8
setopt print_eight_bit
bindkey -e

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'



# Prompt
function () {
  local username="%F{green}%n@%m%f"
  local ctime="%*"
  local cdir="%F{yellow}%~%f"
  local prmpt="%B%#%b"
  local prmpt="%F{green}%0(?||%18(?||%f%F{red}))%#%f"
  local br=$'\n'

  PROMPT="%B$username $ctime $cdir$br$prmpt%b "
  PROMPT2="%_ >"
  SPROMPT="zsh: correct '%R' to '%r' [nyae]? "
  RPROMPT="%1(v|%F{green}%1v%f|)"
}



# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_reduce_blanks

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end



# Other Options
setopt auto_cd
setopt auto_pushd
setopt extended_glob
setopt list_packed
setopt no_list_beep
setopt no_flow_control



# Completion
autoload -Uz compinit; compinit
setopt complete_aliases
zstyle ':completion:*' menu select=2
zstyle ':completion:*' use-cache true
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'



# VCS
# http://d.hatena.ne.jp/mollifier/20100906/p1
autoload -Uz colors; colors
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg



# PATHs
export PATH="$PATH:$HOME/bin"

# golang
export GOROOT=/usr/local/go
export GOPATH="$HOME"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"



# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

function exist() {
  $(which $1 > /dev/null 2>&1)
}



# nvm
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh



# fasd
exist fasd && eval "$(fasd --init auto)"



# homesick
function () {
  local HOMESICK_MAIN="dotfiles"
  alias hcommit="homesick commit $HOMESICK_MAIN"
  alias hpush="homesick push $HOMESICK_MAIN"
  alias hpull="homesick pull $HOMESICK_MAIN"
  alias hsymlink="homesick symlink $HOMESICK_MAIN"
  alias hupdate="homesick pull $HOMESICK_MAIN; homesick symlink $HOMESICK_MAIN"
}



# Aliases
alias g="git"
alias r="rails"
alias sr="spring rails"
alias srk="spring rake"
alias gad="git add"
alias gst="git status"
alias gcm="git commit"
alias gps="git push"
alias gpl="git pull"
alias pyserver="python -m SimpleHTTPServer"
alias c="cd \`s\`"
alias be="bundle exec"
alias getjs="pulldown"



# Each OS
source "$HOME/.zshrc-`uname | awk '{print tolower($0)}'`.zsh"

# MEMO: OS Detection
#   `uname`    -> Darwin
#   `uname -v` -> Darwin Kernel Version 13.0.0: Thu Sep 19 22:22:27 PDT ...
#   ${OSTYPE}  -> darwin11.4.2

[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine



# End
true
