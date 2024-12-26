#!/bin/bash

echo "making output dir"
cmd="mkdir output/"
echo "\$ $cmd"
$cmd

echo "making cache dir"
cmd="mkdir ~/tmp/whisperx-cache"
echo "\$ $cmd"
$cmd

INPUT_DIR="./input/"
echo "get input file names"
cmd="ls $INPUT_DIR"
echo "\$ $cmd"
FILELIST=$($cmd)

for file in $FILELIST; do
    echo $file
    INPUT_FILES+=( $INPUT_DIR$file )
done

echo "INPUT_FILES"

for file in "${INPUT_FILES[@]}"; do
    echo $file
    docker run -v ./tmp/whisperx-cache/:/root/.cache   -v ./input/:/app/input -v ./output/:/app/output rk-whisperx --compute_type=int8 --model=large-v3 --output_format=srt --output_dir=output $file
done

# for file in $INPUT_FILES; do
#     echo $file
#     docker run -v /home/rkhan971/tmp/whisperx-cache:/root/.cache   -v $INPUT_DIR/:/app/input -v ./output/:/app/output rk-whisperx --compute_type=int8 --model=large-v3 --output_format=srt --output_dir=output $file
# done
