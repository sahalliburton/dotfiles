#!/bin/zsh

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Docker Functions
function dshell() { docker exec -it "$@" /bin/sh }
function dbash() { docker exec -it "$@" /bin/bash }
function dlist() { docker "$@" ls }
function dfollow() { docker logs "$@" -f }
function dremove() { docker "$@" prune }
function dpurge() { docker image rm "$@" }

# Kubectl Commands
alias k="kubectl"

# Git aliases
alias g="git"
alias gi="g init"
alias ga="g add ."
alias gc="g commit -m $1"

# Docker aliases
alias d="docker"
alias dsh="dshell"
alias dbh="dbash"
alias dl="dlist"
alias df="dfollow"
alias dp="d ps"
alias dr="dremove"
alias dd="dpurge"

# General aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias ls='ls -Ghrlt'

# Go Functions
function golist() {
  # Get the Command
  cmd="$@"

  case $cmd in
  "local")
    ls $GOPATH/src/github.com/sah27513
    ;;
  "packages")
    ls $GOPATH/src/github.com
    ;;
  *)
    ls $GOPATH/$cmd
    ;;
  esac
}

# GIT PAT
export PAT=sahalliburton:4a76a07a77c5e9760057c658640101f23e769672

# Caseflow ENV
eval "$(rbenv init -)"
eval "$(nodenv init -)"
export POSTGRES_HOST=localhost
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export NLS_LANG=AMERICAN_AMERICA.UTF8
alias bt='REACT_ON_RAILS_ENV=HOT bundle exec rspec'
