

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

if [ -z "$type" ]; then helpme;exit; fi
if [ -z "$file" ]; then helpme;exit; fi
if [ -z "$ext" ]; then helpme;exit; fi

if [[ "$file" != *"/"* ]]; then
  file="$PWD/$file"
fi

open () {
out=$(am start -a android.intent.action.VIEW -t $type/$ext -d file://$file)
}

open
