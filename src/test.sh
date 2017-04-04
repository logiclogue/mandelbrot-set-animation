mydir=${0%/*}
filename=$( basename "$0" )
mandelbrot="./$mydir/../bin/mandelbrot"
list=($( seq -2 0.01 2 | tr " " "\n" ))

for i in $( seq 0 400 )
do
    convert <(
        "$mandelbrot" --julia-i "${list[$i]}" --julia-r "${list[$i]}" --multi-r "${list[$i]}" --multi-i "${list[$i]}" --width 480 --height 360 --bitmap --ratio 1 --iterations 10
    ) test_$( printf %05d $i ).png

    printf "%05d\n" $i
done

ffmpeg -r 30 -i test_%05d.png -s hd720 -vcodec libx264 -crf 25 test.mp4
