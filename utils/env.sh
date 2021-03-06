#!/bin/bash

env_export_all(){
  local file="${1:-.env}"

  if [ -f "$file" ]; then
    $(cat .env | sed 's/^/export /')
  fi
}

env_export(){
  local key="$1"
  local file="${2:-.env}"

  $(cat "$file" | grep "$key" | sed 's/^/export /')
}
