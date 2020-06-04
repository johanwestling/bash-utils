#!/bin/bash

directory_add(){
  local directory="$1"

  [ -n "$directory" ] || read directory
  [ -n "$directory" ] || return 1

  if ! [ -d "$directory" ]; then
    mkdir -p "$directory"
  fi
}

directory_remove(){
  local directory="$1"
  local confirm="$2"
  local confirm_options=(
    "Yes"
    "No"
  )

  [ -n "$directory" ] || read directory
  [ -n "$directory" ] || return 1

  if [ -z "$confirm" ]; then
    if [ -d "$directory" ] || [ -f "$directory" ]; then
      confirm=$(select_value "Delete existing $directory?" "${confirm_options[@]}")
    fi
  fi

  if [ -d "$directory" ]; then
    rm -rf "$directory"
  elif [ -f "$directory" ]; then
    confirm=$(select_value "Delete $directory symlink?" "${confirm_options[@]}")
    rm -f "$directory"
  fi
}
