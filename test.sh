#!/bin/bash

source "utils.sh"

options=("1" "2" "3")
input_select "Label:" "Hint." "" "${options[@]}"
input_text "Label:" "Hint." ""
