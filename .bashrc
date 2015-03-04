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
alias phowm="vim -c \":Unite qfixhowm/new qfixhowm -hide-source-names -auto-preview -no-split\""
alias agit="vim -c \":Agit\""

export HISTCONTROL=ignoreboth
export HISTIGNORE="?:??:???:fg*:bg*:history*:cd*:exit*:pwd*:open .*:e .*:jobs*:dirs*:pushd*:popd*"

export EDITER=vim

export HISTSIZE=99
export HISTFILESIZE=99


#export GIT_PS1_SHOWDIRTYSTATE=true
#add されていない変更の存在を「＊」で示す
#commit されていない変更の存在を「＋」で示す

#export GIT_PS1_SHOWUNTRACKEDFILES=true
#add されていない新規ファイルの存在を「％」で示す

#export GIT_PS1_SHOWSTASHSTATE=true
#stash がある場合は「＄」で示す

#export GIT_PS1_SHOWUPSTREAM=auto
#upstream と同期している場合は「＝」で示す
#upstream より進んでいる場合は「＞」で示す
#upstream より遅れている場合は「＜」で示す

source ~/.git-completion.bash
source ~/.git-flow-completion.bash
source ~/.git-prompt.sh

export PS1='\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\[\e[32;1m\](\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]'

eval "$(rbenv init -)"

