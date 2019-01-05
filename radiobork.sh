#!/bin/bash
#
# script usesd to download/convert the radiobork yt playlist to mp3
# i should have this run in a daily cron job so is keeps up to date

cd ~/Music/RadioBork
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --download-archive downloaded.txt --ignore-errors https://www.youtube.com/playlist?list=PL9q7ZlF3ha4RmyutPsDC-YLpTpnLf31iJ