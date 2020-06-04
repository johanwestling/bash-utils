#!/bin/bash

source "utils.sh"

options=("1" "2" "3")

echo ""

# Select input with hint.
input_select_hint="This is a hint that can be used for further instructions."
value_select_1=$(input_select "Select label:" "${options[@]}")

# Select input with custom marker.
input_select_marker="⚡"
value_select_2=$(input_select "Select label:" "${options[@]}")

# Text input with hint.
input_text_hint="This is a hint that can be used for further instructions."
value_text_1=$(input_text "Text label:")

# Text input with custom marker.
input_text_marker="⚡"
value_text_2=$(input_text "Text label:")

task_title "Collected values:"
echo "value_select_1 = '$value_select_1'"
echo "value_select_2 = '$value_select_2'"
echo "value_text_1   = '$value_text_1'"
echo "value_text_2   = '$value_text_2'"

echo ""
