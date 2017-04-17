#!/bin/bash

mydir=$( dirname "$0" )

source "$mydir/draw.sh"

set_size 1 9 1800
render_images --julia-r -1 --multi-r "${list[$i]}"

render_video
