#!/bin/bash

command -v file > /dev/null 2>&1 || apt install file -y

helpme () {
echo "Open 1.1 for Termux writed in shell script by f1gur4nt"
echo -e "Usage: open [filename]"
echo "EX:"
echo -e "  open /sdcard/image.png"
echo -e "  open /sdcard/video.mp4"
echo -e "  open /sdcard/audio.wav"
echo -e "  open /sdcard/text.txt\n"
}

# Caso o PWD do usuario for o /data/data/com.termux/*, abrir arquivo no tempdir
intermux () {
if [[ "$PWD" == *"/data/data/com.termux"* ]]; then
  rm /sdcard/tmp/* > /dev/null 2>&1 & # Pra nao ocupar espaço no dispositivo do usuario
  cp $file /sdcard/tmp > /dev/null 2>&1 &
  file="/sdcard/tmp/${file##*/}"
fi
}

file=$1
# Checa se todos os patametros estao vazios
if [ -z "$file" ]; then
  helpme
  exit
fi

out=$(file --mime-type $file)
mimetype="${out##*: }"

# Caso o parametro file nao estiver setando o fullpath do arquivo
if [[ "$file" != *"/"* ]]; then
  file="$PWD/$file"; intermux
fi

mkdir /sdcard/tmp > /dev/null 2>&1 &

open () {
  out=$(am start -a android.intent.action.VIEW -t $mimetype -d "file://$file")
}

echo "Opening '$file'"
open
