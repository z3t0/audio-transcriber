#!/bin/bash
echo "removing output dir"
cmd="rm -rf ./output/"
echo "\$ $cmd"
$cmd

echo "making output dir"
cmd="mkdir ./output/"
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
    INPUT_FILES+=( $INPUT_DIR$file )
done

echo "INPUT_FILES"

for file in "${INPUT_FILES[@]}"; do
    echo "processing: $file"
    out_dir="./output/$(basename $file)"
    # remove extension
    out_dir="${out_dir%.*}"

    # TODO: run this with model=large-v3
    # but for getting it working use a smaller model
    cmd="docker run -v ./tmp/whisperx-cache/:/root/.cache   -v ./input/:/app/input -v ./output:/app/output rk-whisperx --compute_type=int8 --model=medium.en --output_format=srt --output_dir=./output $file"
    echo "\$ $cmd"
    $cmd

    echo "DONE docker run"
done