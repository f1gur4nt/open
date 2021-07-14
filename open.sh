

type=$1
file=$2
ext="${file##*.}"

helpme () {
echo "Open 1.0 for Termux writed in shell script by f1gur4nt"
echo -e "Usage: open [filetype] [filename]"
echo "EX:"
echo -e "  open image /sdcard/image.png"
echo -e "  open video /sdcard/video.mp4"
echo -e "  open audio /sdcard/audio.wav"
echo -e "  open text /sdcard/text.txt\n"
}

createtmpdir () {
mkdir /sdcard/.open_tmpdir > /dev/null 2>&1 &
}

if [ -z "$type" ]; then helpme;exit; fi
if [ -z "$file" ]; then helpme;exit; fi
if [ -z "$ext" ]; then helpme;exit; fi

# Caso o parametro file nao estiver setando o fullpath do arquivo
if [[ "$file" != *"/"* ]]; then
  file="$PWD/$file"
fi
# Caso o PWD do usuario for o /data/data/com.termux/*, abrir arquivo no tempdir
if [[ "$PWD" == *"/data/data/com.termux"* ]]; then
  rm /sdcard/.open_tmpdir/* # Pra nao ocupar espaço no dispositivo do usuario
  cp $file /sdcard/.open_tmpdir
  file="/sdcard/.open_tmpdir/${file##*/}"
fi

cd /sdcard/.open_tmpdir || createtmpdir

open () {
out=$(am start -a android.intent.action.VIEW -t $type/$ext -d file://$file)
}

open
