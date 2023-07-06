#!/bin/bash

# Directory to search for files
directory="/home/alirezanqp/Desktop/mongo_backup/backups"

# Calculate the timestamp for files that were created 30 days ago
timestamp=$(date -d "30 days ago" +%s)

# Find files in the directory that were created 30 days ago or earlier
find "$directory" -type f -mtime +29 -exec rm {} \;

