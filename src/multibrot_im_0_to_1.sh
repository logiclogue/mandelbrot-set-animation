#!/bin/bash

mydir=$( dirname "$0" )

source "$mydir/draw.sh"

set_length 0 1 1800
render_images --multi-i _insert_value_ "$@"
render_video

