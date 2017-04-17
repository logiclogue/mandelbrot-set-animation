mydir=$( dirname "$0" )
filename=$( basename "$0" .sh )
builddir="$mydir/../build/$filename"
mandelbrot="./$mydir/../bin/mandelbrot"
list=()
total_frames=0
frame_rate=30
interval=1

mkdir -p "$builddir"

# Parameters: $1 = low_num, $2 = high_num, $3 = total_frames
function set_length {
    local low_num="$1"
    local high_num="$2"
    total_frames="$3"
    local interval

    interval=$( echo "($high_num - $low_num) / $total_frames" | bc -l )
    list=($( seq "$low_num" "$interval" "$high_num" | tr " " "\n" ))
}

# Parameters are to be passed to mandelbrot binary
function render_images {
    for i in $( seq 0 "$total_frames" )
    do
        local args=${*//_insert_value_/${list[$i]}}

        echo "$args"

        convert <(
            echo "$args" | xargs "$mandelbrot" \
                --bitmap --ratio 1 \
                --width 100 --height 100 \
                --iterations 10
        ) "$builddir/${filename}_$( printf %05d "$i" ).png" &&
        printf "Rendered %05d\n" "$i" ||
        printf "An error occurred at %05d\n" "$i" >&2
    done
}

function render_video {
    ffmpeg -r $frame_rate -i "$builddir/${filename}_%05d.png" \
        -s hd720 -vcodec libx264 -crf 25 "$builddir/$filename.mp4"
}
