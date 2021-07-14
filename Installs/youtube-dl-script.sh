# script for youtube-dl
sudo apt install -y ffmpeg curl

#install youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

#download video
#youtube-dl <video URL>


#download mp3
#youtube-dl --extract-audio --audio-format mp3 <video URL>



#download video and mp3
