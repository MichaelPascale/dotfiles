# $OpenBSD: dot.cshrc,v 1.8 2018/02/02 02:29:54 yasuoka Exp $
#
# csh initialization

alias df	df -k
alias du	du -k
alias f		finger
alias h		'history -r | more'
alias j		jobs -l
alias la	ls --color -a
alias lf	ls --color -FA
alias ll	ls --color -lsA
alias tset	'set noglob histchars=""; eval `\tset -s \!*`; unset noglob histchars'
alias z		suspend

#set prompt = '%{\033[1;35m%}%T %c %%%{\033[0m%} '
alias ls gls --color

set path = (~/bin /bin /sbin /usr/{bin,sbin,X11R6/bin,local/bin,local/sbin,games})

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set filec
	set history = 1000
	set ignoreeof
	set mail = (/var/mail/$USER)
	set mch = `hostname -s`
	alias prompt 'set prompt = set prompt = "%T %c %% "'
	setenv PATH ${PATH}:/home/user/.bin
	alias cd 'cd \!*; prompt'
	alias chdir 'cd \!*; prompt'
	alias popd 'popd \!*; prompt'
	alias pushd 'pushd \!*; prompt'
	cd .
	umask 22
endif
