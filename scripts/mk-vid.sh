#!/bin/bash

OUT_PATH=docs/gifs/v2.gif

ffmpeg -i "$1" -pix_fmt rgb8 -r 10 $OUT_PATH && gifsicle -O3 $OUT_PATH -o $OUT_PATH
