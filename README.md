Open (version v 1.1)
--
Open is a Tool that uses "am start" (Android Activity Manager) for open the most types of files, videos, images, etc.

Atention:
--
This tool, obviously, works only in Termux or others terminals for Android.

How to Install :
--
        apt-get update -y
        apt-get install git -y
        git clone https://github.com/f1gur4nt/open
        cd open
        chmod 755 open.sh
        termux-setup-storage
        cp open.sh $HOME/../usr/bin/open

How to Install using Wget :
--
        apt update -y
        apt install wget -y
        wget https://raw.githubusercontent.com/f1gur4nt/open/main/open.sh -O $HOME/../usr/bin/open
        termux-setup-storage
        chmod 755 $HOME/../usr/bin/open
<br>

How to Use :
--
      $ open [filename]
For Example :
--
      $ open /sdcard/DCIM/Screenshots/screenshot.png
      $ open /sdcard/DCIM/Camera/video.mp4
      $ open /sdcard/Musics/music.mp3
      $ open /sdcard/texto.txt
