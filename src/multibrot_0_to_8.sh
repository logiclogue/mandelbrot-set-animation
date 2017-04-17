#!/bin/bash

mydir=$( dirname "$0" )

source "$mydir/draw.sh"

set_length 0 8 800
render_images --multi-r _insert_value_ "$@"
render_video
