## This file is sourced by all *interactive* bash shells on startup.  This
## file *should generate no output* or it will break the scp and rcp commands.
############################################################

if [ -e /etc/bashrc ] ; then
  . /etc/bashrc
fi

############################################################
## PATH
############################################################

function conditionally_prefix_path {
  local dir=$1
  if [ -d $dir ]; then
    PATH="$dir:${PATH}"
  fi
}

conditionally_prefix_path /usr/local/bin
conditionally_prefix_path /usr/local/sbin
conditionally_prefix_path /usr/local/share/python
conditionally_prefix_path ~/bin
conditionally_prefix_path ~/bin/private
conditionally_prefix_path /usr/local/Cellar/smlnj/110.72/libexec/bin
PATH=.:./bin:${PATH}

############################################################
## MANPATH
############################################################

function conditionally_prefix_manpath {
  local dir=$1
  if [ -d $dir ]; then
    MANPATH="$dir:${MANPATH}"
  fi
}

conditionally_prefix_manpath /usr/local/man
conditionally_prefix_manpath ~/man

############################################################
## Other paths
############################################################

function conditionally_prefix_cdpath {
  local dir=$1
  if [ -d $dir ]; then
    CDPATH="$dir:${CDPATH}"
  fi
}


CDPATH=.:${CDPATH}

# Set INFOPATH so it includes users' private info if it exists
# if [ -d ~/info ]; then
#   INFOPATH="~/info:${INFOPATH}"
# fi

############################################################
## Terminal behavior
############################################################

# Change the window title of X terminals
case $TERM in
  xterm*|rxvt|Eterm|eterm)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    ;;
  screen)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
    ;;
esac

# Show the git branch and dirty state in the prompt.
# Borrowed from: http://henrik.nyh.se/2008/12/git-dirty-prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(parse_git_dirty)\)/"
}

if [ `which git 2> /dev/null` ]; then
  function git_prompt {
    parse_git_branch
  }
else
  function git_prompt {
    echo ""
  }
fi

if [ `which rbenv 2> /dev/null` ]; then
  function ruby_prompt {
    echo "($(rbenv version-name))"
  }
elif [ `which ruby 2> /dev/null` ]; then
  function ruby_prompt {
    echo "($(ruby --version | cut -d' ' -f2))"
  }
else
  function ruby_prompt {
    echo ""
  }
fi

# color schemes
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
# Do not set PS1 for dumb terminals
if [ "$TERM" != 'dumb'  ] && [ -n "$BASH" ]; then
#  export PS1='\[\033[32m\]\n[\s: \w] $(ruby_prompt) $(git_prompt)\n\[\033[31m\][\u@\h]\$ \[\033[00m\]'
export PS1='\[\033[31m\][\u@\h \W]\$ \[\033[00m\]'
export PS1="\[${bldgrn}\][\u@\h \[${txtpur}\]\W\[${bldgrn}\]]\$ \[${txtrst}\]"
fi

############################################################
## Optional shell behavior
############################################################

shopt -s cdspell
shopt -s extglob
shopt -s checkwinsize

export PAGER="less"
export EDITOR="vi"

############################################################
## History
############################################################

# When you exit a shell, the history from that session is appended to
# ~/.bash_history.  Without this, you might very well lose the history of entire
# sessions (weird that this is not enabled by default).
shopt -s histappend

export HISTIGNORE="&:pwd:ls:ll:lal:[bf]g:exit:rm*:sudo rm*"
# remove duplicates from the history (when a new item is added)
export HISTCONTROL=erasedups
# increase the default size from only 1,000 items
export HISTSIZE=10000

############################################################
## Aliases
############################################################

if [ -e ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

############################################################
## Bash Completion, if available
############################################################

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
elif  [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif  [ -f /etc/profile.d/bash_completion ]; then
  . /etc/profile.d/bash_completion
elif [ -e ~/.bash_completion ]; then
  # Fallback. This should be sourced by the above scripts.
  . ~/.bash_completion
fi

############################################################
## cdargs, if available
############################################################

if [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ]; then
  . /usr/local/etc/bash_completion.d/cdargs-bash.sh
fi

############################################################
## Other
############################################################

if [[ "$USER" == '' ]]; then
  # mainly for cygwin terminals. set USER env var if not already set
  USER=$USERNAME
fi

[[ -s "/Users/ktangwon/.rvm/scripts/rvm" ]] && source "/Users/ktangwon/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin
CLASSPATH=$CLASSPATH:$HOME/opt/share/java/zmq.jar:.
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opt/lib
