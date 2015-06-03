# The following lines were added by compinstall
zstyle :compinstall filename '/f/homes/ehurst/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -U select-word-style
select-word-style bash

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git hg svn
precmd () { vcs_info; }


#zstyle ':vcs_info:*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "

#autoload -U promptinit
#promptinit
#prompt redhat

#export PS1='%n@%m %# '
#export RPROMPT='[%~] %t'
setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%* %l %j [%B%F{blue}%n%f@%F{magenta}%m%f%b : %F{green}%~%f] ${SSH_AGENT_PID:+SSH} ${vcs_info_msg_0_}${NEWLINE}%# '

#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
alias ls='ls -B'
alias emacs='emacs -nw'
alias sudo='sudo env PATH=$PATH'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

case $TERM in
     *xterm*|rxvt|(dt|k|E)term)
          precmd () { print -Pn "\e]0;%n@%m: [%~]\a"; vcs_info; }
          preexec () { print -Pn "\e]0;%n@%m: $1\a" }
          ;;
esac

source ~/.profile
for i in `find /etc/profile.d/ -type f`; do source $i; done


