#!/bin/bash

song_info=$(playerctl metadata --format '   {{artist}} - {{title}}')

echo "$song_info"
