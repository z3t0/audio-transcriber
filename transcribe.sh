#!/bin/bash

TIMESTAMP=$(date -Is)

echo "making output dir"
cmd="mkdir output/$TIMESTAMP"
echo "\$ $cmd"
$($cmd)

echo "making cache dir"
cmd="mkdir ~/tmp/whisperx-cache"
echo "\$ $cmd"
$($cmd)

echo "running whisperx on the files at ./mp3_test/"
cmd="docker run -v /home/rkhan971/tmp/whisperx-cache:/root/.cache   -v ./mp3_test/:/app/input -v ./output/:/app/output rk-whisperx --compute_type=int8 --model=large-v3 --output_format=srt --output_dir=output/$TIMESTAMP input/241209_1527.mp3"
echo "\$ $cmd"
$($cmd)

