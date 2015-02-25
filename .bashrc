# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias vi=vim
alias e=explorer

alias ls="ls -F"
alias la="ls -aF"
alias ll="ls -l"
alias j=jobs
alias vi=vim
alias howm="vim -c \":Unite qfixhowm/new qfixhowm -hide-source-names\""

export HISTCONTROL=ignoreboth
export HISTIGNORE="?:??:???:fg*:bg*:history*:cd*:exit*:pwd*:open .*:e .*:jobs*:dirs*:pushd*:popd*"

export EDITER=vim

#export HISTSIZE=99

#source /usr/local/etc/bash_completion.d/git-completion.bash

#GIT_PS1_SHOWDIRTYSTATE=true
#add されていない変更の存在を「＊」で示す
#commit されていない変更の存在を「＋」で示す

#GIT_PS1_SHOWUNTRACKEDFILES=true
#add されていない新規ファイルの存在を「％」で示す

#GIT_PS1_SHOWSTASHSTATE=true
#stash がある場合は「＄」で示す

#GIT_PS1_SHOWUPSTREAM=auto
#upstream と同期している場合は「＝」で示す
#upstream より進んでいる場合は「＞」で示す
#upstream より遅れている場合は「＜」で示す

#source /usr/local/etc/bash_completion.d/git-prompt.sh
export PS1='\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\[\e[32;1m\](\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]'

# export PATH="/usr/local/rbenv/bin:$PATH"
# export RBENV_ROOT=/usr/local/rbenv
# eval "$(rbenv init -)"
