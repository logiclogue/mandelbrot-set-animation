#!/bin/bash

mydir=$( dirname "$0" )
filename=$( basename "$0" .sh )
builddir="$mydir/../build/$filename"
mandelbrot="./$mydir/../bin/mandelbrot"
list=($( seq 0 0.01 8 | tr " " "\n" ))

mkdir -p "$builddir"

for i in $( seq 0 800 )
do
    convert <(
        "$mandelbrot" \
            --bitmap --ratio 1 \
            --width 100 --height 100 \
            --multi-r "${list[$i]}" \
            --iterations 10 "$@"
    ) "$builddir/${filename}_$( printf %05d "$i" ).png"

    printf "%05d\n" "$i"
done

ffmpeg -r 30 -i "$builddir/${filename}_%05d.png" -s hd720 -vcodec libx264 \
    -crf 25 "$builddir/$filename.mp4"
