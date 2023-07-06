#!/bin/bash

# MongoDB database credentials
MONGO_HOST="localhost"
MONGO_PORT="27020"
MONGO_USERNAME="test"
MONGO_PASSWORD="test"
MONGO_DATABASE="test"


# Backup directory
DATE=`date +%Y-%m-%d_%H-%M-%S`
BACKUP_DIR="/home/alirezanqp/Desktop/mongo_backup/backups"
BACKUP_NAME="mongodb_backup_$DATE.gz"

# Zip file details
ZIP_FILE="$BACKUP_DIR/mongodb_backup_$DATE.zip"
ZIP_PASSWORD="66554422"

# Perform MongoDB backup
mongodump --host "$MONGO_HOST" --port "$MONGO_PORT" --db "$MONGO_DATABSAE" --gzip --archive="$BACKUP_DIR/$BACKUP_NAME"

# Create a password-protected zip file
zip -P "$ZIP_PASSWORD" "$ZIP_FILE" "$BACKUP_DIR/$BACKUP_NAME"

# Remove the backup directory
rm -rf "$BACKUP_DIR/$BACKUP_NAME"

echo "Backup completed: $ZIP_FILE"

