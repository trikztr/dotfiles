#!/bin/bash

# Fetch metadata from Spotify using gdbus
metadata=$(gdbus call --session --dest org.mpris.MediaPlayer2.spotify --object-path /org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata)

# Extract artist and title from the metadata
artist=$(echo "$metadata" | sed -n "s/.*'xesam:artist': <\['\([^']*\)'\]>.*/\1/p")
title=$(echo "$metadata" | sed -n "s/.*'xesam:title': <'\([^']*\)'>.*/\1/p")

# Check if artist or the title is empty
if [[ -z "$artist" || -z "$title" ]]; then
    echo "Paused"
else
    echo "$artist - $title"
fi
