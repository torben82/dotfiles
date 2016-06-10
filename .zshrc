# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/TOG/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
source $HOME/.aliases
autoload -Uz colors && colors
autoload -Uz promptinit
promptinit
#source ~/zsh-git-prompt/zshrc.sh
#
##PS1='%B%n@%m:%c%b$(git_super_status)%# '
#PROMPT='%{$fg[blue]%}%B%n@%m:%c%b%{$reset_color%}$(git_super_status)%# '
source ~/git-prompt.sh
#source ~/gitStatusPrompt.sh
git_statusPrompt(){
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if git diff-index --quiet HEAD; then
      echo "\[\e[1;32m\]OK\[\e[0m\]"
   else
      echo "\[\e[1;31m\]!!\[\e[0m\]"
    fi
  else
    echo "bar"
  fi
}
#PS1='\[\e[1;32m\][\u@\h \W $(__git_ps1 " (%s)")]\$\[\e[0m\] '
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
#GIT_PS1_SHOWUNTRACKEDFILES = true
GIT_PS1_SHOWCOLORHINTS=true
#PROMPT_COMMAND='__git_ps1 "\[\e[0;36m\]\u@\h:\W\[\e[0m\]" "\\\$ " "{%s $(git_statusPrompt)}"'
#PROMPT_COMMAND='%{$fg[blue]%}%B%n@%m:%c%b%{$reset_color%}$(git_statusPrompt)%# '
#precmd () { __git_ps1 "%n" ":%~$ " "|%s" }
precmd () { __git_ps1 "%{$fg[blue]%}%B%n@%m:%c%b%{$reset_color%}"  "%# " " (%s)" }
