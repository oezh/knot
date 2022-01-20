#!/bin/zsh
filename=$1
7z x ${filename} && rm -rf ${filename}
