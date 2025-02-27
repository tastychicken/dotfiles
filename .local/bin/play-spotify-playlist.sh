#!/bin/bash

PLAYLIST_URI=$1

if [[ -z $PLAYLIST_URI ]]; then
  echo "no playlist uri provided."
  exit 1
fi

if ! [[ $PLAYLIST_URI =~ (spotify):(playlist):[0-9a-zA-Z]+ ]]; then
  echo "not a valid spotify url, to get a playlist URI hover over the 'Share' context menu item and hold ALT, then click 'Copy Spotify URI'."
  exit 1
fi

# check if spotify is running, run if not and wait 2 seconds
if ! pgrep -x "spotify" > /dev/null
then
  echo "starting spotify"
  (spotify >/dev/null 2>&1 &)
  sleep 3
fi

# turn off shuffle
playerctl --player spotify shuffle off

# start playlist
playerctl --player spotify open $PLAYLIST_URI
