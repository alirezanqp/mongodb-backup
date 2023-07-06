#!/bin/bash

# Directory to search for files
DIRECTORY="/home/username/mongo_backup/backups"

# Find files in the directory that were created 30 days ago 
find "$DIRECTORY" -type f -mtime +30 -exec rm -rf {} \;

