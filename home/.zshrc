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
  local br="
"

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



# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"



# nvm
source ~/.nvm/nvm.sh



# fasd
[ fasd ] && eval "$(fasd --init auto)"



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
alias gad="git add"
alias gst="git status"
alias gcm="git commit"
alias gps="git push"
alias gpl="git pull"
alias pyserver="python -m SimpleHTTPServer"



# Each OS
case ${OSTYPE} in
  darwin*)
    ln -fs ~/.sublime/User \
           ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
    ln -fs ~/.sublime/User/themes/flatland \
           ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Theme\ -\ Flatland
    alias copywd="pwd | pbcopy"
    alias ls="ls -FG"
    alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias vim=vi
    export SCALA_HOME=/usr/local/Cellar/scala/2.10.2/libexec
    export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
    ;;

  linux*)
    xmodmap .Xmodmap.ubuntu
    ln -fs ~/.sublime/User \
           ~/.config/sublime-text-2/Packages/User
    ln -fs ~/.sublime/User/themes/flatland \
           ~/.config/sublime-text-2/Packages/Theme\ -\ Flatland
    function subl() {
      ~/Applications/Sublime\ Text\ 2/sublime_text $@ &
    }
    ;;

esac

[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine



# End
true
