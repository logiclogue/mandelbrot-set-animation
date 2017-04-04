mydir=${0%/*}
filename=$( basename "$0" )
mandelbrot="./$mydir/../bin/mandelbrot"
list=($( seq 2 -0.01 -2 | tr " " "\n" ))

printf %s "$filename"

for i in $( seq 0 200 )
do
    convert <(
        "$mandelbrot" --julia-r "${list[$i]}" --width 480 --height 360 --bitmap --ratio 1 --iterations 10
    ) test_$( printf %05d $i ).png
done

ffmpeg -r 30 -i test_%05d.png -s hd720 -vcodec libx264 -crf 25 test.mp4
