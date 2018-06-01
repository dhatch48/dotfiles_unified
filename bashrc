# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
alias st="tmuxp load work || tmux"
alias findswap="find . -iname '*.swp'"
alias rmswap="find . -iname '*.swp' -print0 | xargs -0 rm"
# Show bash keybindings
alias showkeys="bind -p | grep -v '^#\|self-insert\|^$'"
alias eb="vim $HOME/.bashrc" # Edit Bash
alias ta='tmux attach-session'
alias tl='tmux list-session'
alias appversion='mdls -name kMDItemVersion'


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

if [ -f ~/bin/wp-completion.bash ]; then
    . ~/bin/wp-completion.bash
fi

echo ""
echo -n "Welcome to bash on $OSTYPE, "; whoami
echo ""
echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
echo ""
cal
echo -n "Uptime: "; uptime
echo ""


# or set it and export it in same line
export HISTSIZE=1000				    	# 500 is default
export HISTTIMEFORMAT='%b %d %T  '		    # using strftime
export HISTCONTROL=ignoreboth:erasedups		# ignoredups:ignorespace
export HISTIGNORE="t *:fg:delHistory*:history:history -d*:h:h -d*:pwd:exit:df:ll:ls:man *:"
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# append to the history file, don't overwrite it
shopt -s histappend
# Set other shell options
shopt -s globstar   # Turn on **
shopt -o -s notify  # Notify when background jobs terminate
shopt -q -s cdspell # Help correct typos while using cd command

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export MYNAME='David Hatch'
export EDITOR=vim

export LANG=en_US.UTF-8 
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -d "$HOME/public_html/wp-content" ]; then
    export wpcontent="$HOME/public_html/wp-content"
fi

RESET="\[$(tput sgr0)\]"
export PS1="\[\e[1;33;40m\]\w$RESET\n\[\e[4;34m\]\u@\h$RESET \[\e[35m\]\\$ $RESET"

# ANSI color codes
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

##################################################
# Readline options
##################################################
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "set show-mode-in-prompt on"
bind 'set vi-ins-mode-string \1\e[30;1;44m\2 I \1\e[0m\2'
bind 'set vi-cmd-mode-string \1\e[5;30;1;103m\2 N \1\e[0m\2'

# Use vi key bindings instead of emacs
set -o vi
# Poly fill some emacs bindings in vi mode
bind -m vi-command '".":insert-last-argument'
bind -m vi-insert '"\C-l":clear-screen'
bind -m vi-insert '"\C-a":beginning-of-line'
bind -m vi-insert '"\C-e":end-of-line'
bind -m vi-insert '"\C-w":backward-kill-word'
bind -m vi-insert '"\e\C-e":shell-expand-line'
bind -m vi-insert '"\C-x\C-v":display-shell-version'

# Other cool stuff
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-command '"gg":beginning-of-history'
bind -m vi-command '"G":end-of-history'
bind -m vi-command '"u":undo'
bind -m vi-insert '" ": magic-space'
bind -m vi-insert -x '"\eOP": "tmux attach-session"' #F1
bind -m vi-insert -x '"\eOQ": "tmux detach-client"'  #F2
# Up/Down arrow for filtered history search
bind -m vi-insert '"\e[A": history-search-backward'
bind -m vi-insert '"\e[B": history-search-forward'
# Ctrl+left/right arrow'
bind -m vi-insert '"\e[1;5D": backward-word'
bind -m vi-insert '"\e[1;5C": forward-word'
##################################################

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
    end=${2:-$1}
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

# Cygwin only stuff
if [[ $OSTYPE == cygwin ]]; then
    # Chages default file permissions from umask 022 (-rwxr-xr-x)
    umask 077

    # Avoid path duplicates when tmux loads
    if [ -z "${TMUX}" ]; then
        export PATH="$HOME/bin:/usr/sbin:$PATH"
    fi
    export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

    export unified='/cygdrive/d/wamp/www/unified/'
    export modeltools='/cygdrive/d/wamp/www/unified/tools'
    export winhome="$(cygpath -H)/$USER"
    # list and sort by creation date
    alias lc="stat -c '%w    %n' * | sort -k1r"
    alias open='cygstart'   # mac-like open
    alias phptools='php "d:\wamp\www\unified\tools\createSqlForModel.php"'

    cygwinSetup="$winhome/Downloads/setup-x86.exe"
    # Download latest cygiwn setyp and run the installer semi attended
    alias cygup="wget -N -P $winhome/Downloads/ https://www.cygwin.com/setup-x86.exe && chmod u+x $cygwinSetup; $cygwinSetup -M"
    alias cyg-get="$cygwinSetup -q -P"
    alias sudo='cygstart --action=runas'
    alias arp='arp -a |tr - :'
    alias down="cd $winhome/Downloads"

# Mac OSX stuff/overrides
elif [[ $OSTYPE == darwin* ]]; then
    export CLICOLOR=1   # simply enables coloring of your terminal.
    export LSCOLORS=GxFxCxDxBxegedabagaced  # specifies how to color specific items
    export PATH="$HOME/bin:$PATH"
    # Specify options grep should use by default
    export GREP_OPTIONS="--color=auto"
    alias lc='ls -AlhtU'
    # some apple script
    alias unmute="osascript -e 'set volume output muted false'"
    alias mute="osascript -e 'set volume output muted true'"
    # Dramatically improve grep performance - temporarily set collation to ascii
    # For grep version older than 2.7
    # Prepend 'LC_ALL=C'
    # ex. LC_ALL=C frep 'asdf' *.txt
    alias grep='LC_ALL=C grep'
    alias fgrep='LC_ALL=C fgrep'
    alias egrep='LC_ALL=C egrep'
    alias brewck="brew update; brew outdated"
    alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"
    alias getsw='system_profiler SPSoftwareDataType'
    alias gethw='system_profiler SPHardwareDataType'

    launchctlFind () {
        LaunchctlPATHS=( \
            ~/Library/LaunchAgents \
            /Library/LaunchAgents \
            /Library/LaunchDaemons \
            /System/Library/LaunchAgents \
            /System/Library/LaunchDaemons \
        )
        for curPATH in "${LaunchctlPATHS[@]}";do
            grep -Ri "$1" "$curPATH"
        done
        return 0;
    }
    export -f launchctlFind

    function del() {
        for thisArg in "$@"; do
            mv -n "$thisArg" ~/.Trash
        done
    }
    export -f del
fi

# This is for your git auto completion
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
elif [ -f /usr/local/share/bash-completion/bash_completion ]; then
    source /usr/local/share/bash-completion/bash_completion
fi

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

# Find difference between two files' lines
#grep -Fxvf file1 file2
# or
#comm -13 <(sort file1) <(sort file2)

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
