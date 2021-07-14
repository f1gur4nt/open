Open (version v 1.0)
--
Open is a Tool that uses "am start" (Android Activity Manager) for open the most types of files, videos, images, etc.

Atention:
--
This tool, obviously, works only in Termux or others terminals for Android.

How to Install :
--
apt-get update -y;apt-get install git -y;git clone https://github.com/f1gur4nt/open;cd open;chmod 755 open.sh;cp open.sh $HOME/../usr/bin/open

How to Install using Wget :
--
apt update -y;apt install wget -y;wget -qO- https://github.com/f1gur4nt/open/raw/main/open.sh > $HOME/../usr/bin/open; chmod 755 $HOME/../usr/bin/open
<br>

How to Use :
--
      $ open [filetype] [filename]
For Example :
--
      $ open image /sdcard/DCIM/Screenshots/screenshot.png
      $ open video /sdcard/DCIM/Camera/video.mp4
      $ open music /sdcard/Musics/music.mp3
      $ open text /sdcard/texto.txt
