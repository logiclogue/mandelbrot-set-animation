#!/bin/bash

mydir=$( dirname "$0" )

source "$mydir/draw.sh"

set_length 1 9 1800
render_images --julia-r -1 --multi-r _insert_value_ "$@"
render_video
