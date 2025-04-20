#! /usr/bin/env zsh
#
# Aliases
# =======
#
# This file contains all the aliases that are used in the shell. Aliases are
# shortcuts for commands that are used often. For example, instead of typing
# `ls -l` you can just type `ll`. This file is sourced in the `.zshrc` file.
#
# For more information on aliases, check out:
# https://scriptingosx.com/2017/01/about-bash_profile-and-bashrc-on-macos/
# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions

# General
# -------


function gwip() {
  git add -A
  git rm  2> /dev/null
  git commit --no-verify --no-gpg-sign --message '--wip-- [skip ci]' $argv
}

function sync() {
  source $ZDOTDIR/.zshrc
}

alias vim="nvim"

alias pinentry='pinentry-mac'

# fix fast typing
alias brwe="brew"

alias nix-shell='nix-shell --run $SHELL'
function nix() {
  if [[ $1 == "develop" ]]; then
    shift
    command nix develop -c $SHELL "$@"
  else
    command nix "$@"
  fi
}
