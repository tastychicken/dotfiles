#!/bin/bash

WINDOW_NAME="code"

if [[ "$1" = "pds" ]] ; then
  WINDOW_NAME="pds"
  cd ~/src/pds7/pds-cm
  P2=../pds-api
  P3=../pds-mqtt
fi

tmux new-window -n "$WINDOW_NAME"
tmux split-window -h -c "$P2"
tmux split-window -v -c "$P3"
tmux select-pane -t 1
