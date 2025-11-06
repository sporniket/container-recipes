#!/bin/bash

# Script de décompression des archives TAR.XZ vers la racine
set -e

echo "Start extracting archives..."

for archive_file in /tmp/archives/*.tar.xz; do
    if [ -f "$archive_file" ]; then
        echo "Extracting $(basename "$archive_file")..."
        
        # --overwrite to replace existing files
        # -p to preserve permission (includes the execution flag)
        # -C / to extract into root
        tar -xJpf "$archive_file" -C / --overwrite
        
        echo "✓ $(basename "$archive_file") successfully extracted"
    fi
done

echo "Done extracting files."
