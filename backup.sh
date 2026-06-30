#!/bin/bash

if [ "$1" == "--help" ]; then
    echo "backup.sh - a simple folder backup tool"
    echo ""
    echo "Usage: ./backup.sh <folder_name>"
    echo "Example: ./backup.sh inbox"
    echo ""
    echo "Creates a timestamped copy of the given folder"
    echo "in the same directory, e.g. inbox_backup_2026-06-30_16-31-09"
    exit 0
fi

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder_name>"
    echo "Example: ./backup.sh inbox"
    exit 1
fi

echo "You gave me this folder: $1"

if [ -d "$1" ]; then
    echo "Yes, that folder exists!"
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    backup_name="${1}_backup_${timestamp}"
    cp -r "$1" "$backup_name"
    echo "Backup created: $backup_name"
    exit 0
else
    echo "Hmm, I can't find a folder called $1"
    exit 1
fi