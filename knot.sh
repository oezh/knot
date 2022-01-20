#!/bin/bash

filename=$1

while [ -z "$SALIDA" ]; do
	read -p "Output filename: (press enter for [${filename}]): " SALIDA
  : ${SALIDA:=${filename}}
done


7z a -p -mx=9 -mhe -t7z -sdel ${SALIDA}.7z "$@"
