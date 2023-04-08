# vim: set ft=sh:

set -x XDG_CONFIG_HOME $HOME/.config
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH /usr/local/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

set -x EDITOR nvim

set -x LANG ja_JP.UTF-8
set -x GIT_PAGER "LESSCHARSET=utf-8 less"

alias vim='nvim'
alias g='git'
alias t='tig'
alias ta='tig --all'
alias tst='tig status'
alias b='bundle'
alias be='bundle exec'
alias awk='gawk'
alias ls='exa --group-directories-first --git --icons'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls -T'
alias cat='bat'

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
status --is-interactive; and rbenv init - fish | source

eval (nodenv init - | source)
eval (direnv hook fish | source)
eval (starship init fish)
eval (zoxide init fish | source)


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end
