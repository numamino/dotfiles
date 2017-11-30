# direnv
eval "$(direnv hook zsh)"

# show hidden-files
alias hfon="defaults write com.apple.finder AppleShowAllFiles true|killall Finder"

# hidden hidden-files
alias hfoff="defaults write com.apple.finder AppleShowAllFiles false|killall Finder"

# git
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# php
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# postgresql
export PGDATA=/usr/local/var/postgres

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home

# env
export LANG=ja_JP.UTF-8
export PATH=$PATH:/usr/local/sbin

# color
autoload -Uz colors
colors
  
# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# prompt
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# word delimiter
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
 
# completion
autoload -Uz compinit
compinit
 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
 
# vcs
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
 
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
 
 
# show japanese file
setopt print_eight_bit
 
# no beep sound
setopt no_beep
 
# no flow control
setopt no_flow_control
 
# ignore eof
setopt ignore_eof
 
# comment
setopt interactive_comments
 
# cd
setopt auto_cd
setopt auto_pushd

# no duplicate directory
setopt pushd_ignore_dups
 
# history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
 
# wild card
setopt extended_glob
 
# key bind
bindkey '^R' history-incremental-pattern-search-backward
 
# alias
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias -g L='| less'
alias -g G='| grep'
 
# clipbord
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# for mac
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac
 
# vim:set ft=zsh:

# THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/numamino/.gvm/bin/gvm-init.sh" ]] && source "/Users/numamino/.gvm/bin/gvm-init.sh"
