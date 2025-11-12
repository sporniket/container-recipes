#!/bin/bash

# Script de décompression des archives TAR.XZ vers la racine
set -e

echo "Start extracting Emutos..."
echo "Size : $1"
echo "Version : $2"

source_folder="/tmp/build-hatari/emutos-${1}-${2}"
target_folder="/usr/local/share/hatari"
archive_file="${source_folder}.zip"
basename="etos${1}"
if [ -f "$archive_file" ]; then
    echo "Extracting $(basename "$archive_file")..."
    
    # --overwrite to replace existing files
    # -p to preserve permission (includes the execution flag)
    # -C / to extract into root
    unzip "$archive_file"
    
    echo "OK : $(basename "$archive_file") successfully extracted"

    echo "Copying emutos image and debug symbols"
    cp "${source_folder}/${basename}.img" "${target_folder}/tos.img"
    cp "${source_folder}/${basename}.sym" "${target_folder}/tos.sym"
    echo "OK : succesfully installed $(ls $target_folder/tos.*)"
fi

echo "Done extracting Emutos."
