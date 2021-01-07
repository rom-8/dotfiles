# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias vi=vim
alias e=explorer

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -aFG"
  export LSCOLORS=gxfxcxdxbxegedabagacad
  ;;
cygwin*)
  alias ls="ls -F --color=auto --show-control-chars"
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac
alias j=jobs
alias vi=vim
#alias howm="vim -c \":Unite qfixhowm/new qfixhowm -hide-source-names\""
#alias phowm="vim -c \":Unite qfixhowm/new qfixhowm -hide-source-names -auto-preview -no-split\""
#alias agit="vim -c \":Agit\""
alias hex2dec="printf '%d\n'"
alias dec2hex="printf '%x\n'"

# fzf
alias ge="grep_edit"
alias gep="grep_edit_with_preview"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'


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
#source ~/.git-flow-completion.bash
source ~/.git-prompt.sh

export PS1='\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\[\e[32;1m\](\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]'

#eval "$(rbenv init -)"

grep_edit(){
	local opt=""
	if [ "$1" = "-i" ]; then
		local opt="-"
		shift
	fi
	if [ $# -lt 1 ]; then
		echo "keyword and folder plz." >&2
		return 1
	fi
	##local l=$(grep -rnI $opt $* | fzf | awk -F: '{print "+"$2" "$1}')
	local l=$(rg -n $opt $* | fzf --preview-window=right:0% | awk -F: '{print "+"$2" "$1}')
	if [[ -n "$l" ]]; then
		vim $l
	fi
}

grep_edit_with_preview(){
	local opt=""
	if [ "$1" = "-i" ]; then
		local opt="-"
		shift
	fi
	if [ $# -ne 2 ]; then
		echo "keyword and folder plz." >&2
		return 1
	fi
	#local l=$(grep -rnI $opt $* | awk -F: '{print $1}' | fzf )
	local l=$(rg -o $opt $* | awk -F: '{print $1}'|uniq | fzf )
	if [[ -n "$l" ]]; then
		vim $l
	fi
}
