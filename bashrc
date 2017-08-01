# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -alht' # Sort by mod date
# list and sort by creation date
alias lc="stat -c '%w    %n' * | sort -k1r"
alias lad='ls -d */'

# can also redefine a command to change default options
if [ -e /usr/bin/vimx ]; then
    alias vim='/usr/bin/vimx'
fi
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias h='history'
alias tart='tar -tzvf'   # List file in archive
alias tarc='tar -czvf'   # archive to file and gzip
alias tarx='tar -xzvf'   # unarchive and ungzip
alias less='less -iMRS'
alias svns='svn stat -u'
alias st="tmux attach-session || tmuxinator start mine || tmux"
alias getVundle="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
alias findswap="find . -iname '*.swp'"
alias rmswap="find . -iname '*.swp' -print0 | xargs -0 rm"
# Show bash keybindings
alias showkeys="bind -p | grep -v '^#\|self-insert\|^$'"


# Git aliases
alias g='git status'
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gu='git remote update'
alias gsi='git status --ignored'
alias gl='git log'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gca='git commit --amend'
alias gp='git push'

# Git log options found here: https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-log
# git log -n <limit>
# Limit the number of commits by <limit>. For example, git log -n 3 will display only 3 commits.
#
# git log --oneline
# Condense each commit to a single line. This is useful for getting a high-level overview of the project history.
#
# git log --stat
# Along with the ordinary git log information, include which files were altered and the relative number of lines that were added or deleted from each of them.
#
# git log -p
# Display the patch representing each commit. This shows the full diff of each commit, which is the most detailed view you can have of your project history.
#
# git log --author="<pattern>"
# Search for commits by a particular author. The <pattern> argument can be a plain string or a regular expression.
#
# git log --grep="<pattern>"
# Search for commits with a commit message that matches <pattern>, which can be a plain string or a regular expression.
#
# git log <since>..<until>
# Show only commits that occur between <since> and <until>. Both arguments can be either a commit ID, a branch name, HEAD, or any other kind of revision reference.
#
# git log <file>
# Only display commits that include the specified file. This is an easy way to see the history of a particular file.
#
# git log --graph --decorate --oneline
# A few useful options to consider. The —graph flag that will draw a text based graph of the commits on the left hand side of the commit messages. —decorate adds the names of branches or tags of the commits that are shown. —oneline shows the commit information on a single line making it easier to browse through commits at-a-glance.
#
# git log -p <file>
# Mix and match - show the patch(diff) of every commit of this file.

# Todo.txt stuff
alias t='todo.sh -d $HOME/.todo.cfg'
complete -F _todo t
export TODOTXT_DEFAULT_ACTION=ls
# Turns auto archive off
export TODOTXT_AUTO_ARCHIVE=0

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

echo ""
echo -n "Welcome to bash on $OSTYPE, "; whoami
echo ""
echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
echo ""
cal
echo -n "Uptime: "; uptime
echo ""

# Avoid path duplicates when tmux loads
if [ -z "${TMUX}" ]; then
    export PATH="$HOME/bin:/usr/sbin:$PATH"
fi

# or set it and export it in same line
export HISTSIZE=1000				    	# 500 is default
export HISTTIMEFORMAT='%b %d %I:%M %p '		# using strftime
export HISTCONTROL=ignoreboth:erasedups		# ignoredups:ignorespace
export HISTIGNORE="t *:fg:delHistory*:history:history -d*:h:h -d*:pwd:exit:df:ll:ls:man *:"
# append to the history file, don't overwrite it
shopt -s histappend
shopt -s globstar   # Turn on **

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export EDITOR=vim

export LANG=en_US.UTF-8 
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ "$OSTYPE" = "cygwin" ]; then
    # Chages default file permissions from umask 022 (-rwxr-xr-x)
    umask 027

    alias open='cygstart'   # mac-like open
    alias phptools='php "d:\wamp\www\unified\tools\createSqlForModel.php"'
    export unified='/cygdrive/d/wamp/www/unified/'
    export modeltools='/cygdrive/d/wamp/www/unified/tools'
    export winhome="$(cygpath -H)/$USER"
fi

if [ -d "$HOME/public_html/wp-content" ]; then
    export wpcontent="$HOME/public_html/wp-content"
fi

GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
PURPLE="\[$(tput setaf 5)\]"
RESET="\[$(tput sgr0)\]"
export PS1="$YELLOW\w$RESET\n$GREEN\u@\h$RESET $PURPLE\$$RESET "

export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

# GREP_COLOR codes
# Attributes:   Text color:    Background:
#   0 reset all   30 black       40 black
#   1 bright      31 red         41 red
#   2 dim         32 green       42 green
#   4 underscore  33 yellow      43 yellow
#   5 blink       34 blue        44 blue
#   7 reverse     35 purple      45 purple
#   8 hidden      36 cyan        46 cyan
#                 37 white       47 white
# Separate with ";"
#
export GREP_COLOR="34;40"

# Specify options grep should use by default
#export GREP_OPTIONS="--color=auto"

# Up/Down arrow for filtered history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Ctrl+left/right arrow
bind '"\e[1;5D": backward-word'
bind '"\e[1;5C": forward-word'

# Use vi key bindings instead of emacs
#set -o vi
#bind -m vi-command ".":insert-last-argument
#bind -m vi-command "gg":beginning-of-history
#bind -m vi-command "G":end-of-history
#bind -m vi-command "u":undo
#bind -m vi-insert "\C-l.":clear-screen
#bind -m vi-insert "\C-a.":beginning-of-line
#bind -m vi-insert "\C-e.":end-of-line
#bind -m vi-insert "\C-w.":backward-kill-word
#bind -m vi-insert "jk":vi-movement-mode

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
#        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
#        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
export -f extract

delHistory () {
    start=$1
    end=$2
    count=$(( end - start ))
    while [[ $count -ge 0 ]] ; do
        history -d "$start"
        ((count--))
    done
}
export -f delHistory

path () {
    tr : '\n' <<< $PATH
}
export -f path

# Recursively remove files
#find . -name "Thumbs.db" -print0 | xargs -0 rm
# Explanation
# find in current dir and below the name in quotes and print it ending with
# null... -0 tells xargs that args are null separated and removes each file

# Search and copy files
#find . -iname "*foobar*" -exec cp '{}' ~/foo/bar \;

# Search in files for multiple patterns on different lines (logical AND)
#fgrep -lZ 'R/Name(Dark)' *.ai | xargs -0 fgrep -lz 'NumLayers: 3'
# Explanation
# -lZ outputs filenames null delimited. -z (lower) reads input null delimited
# instead of newline


#File Permissions: Octal Notation
#------------------------------------
#
#		user	group	other
#
#	r	4	4	4
#	w	2	2	0
#	x	1	0	0
#
#	total	7	6	4
#
#	rwxrw-r-- = 764
#
#	rwxr-xr-x = 755
#
#	rwx------ = 700
#
#	rwxr--r-- = 744
#
#	r-------- = 400  (root must change or execute)
#
#   u+rwx    User read, write, execute
#   o-w      Other minus write
