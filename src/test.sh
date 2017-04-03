mydir=${0%/*}
filename=$( basename "$0" )
mandelbrot="./$mydir/../bin/mandelbrot"

printf %s "$filename"

for i in $( seq 0 -0.1 -2 )
do
    convert <($mandelbrot --julia-r "$i" --width 480 --height 360 --bitmap --ratio 1) "$i$filename.png"
done
