#!/bin/bash
#
# script usesd to download/convert the radiobork yt playlist to mp3

cd ~/Music/RadioBork
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --download-archive downloaded.txt --ignore-errors https://www.youtube.com/playlist?list=PL9q7ZlF3ha4RmyutPsDC-YLpTpnLf31iJ