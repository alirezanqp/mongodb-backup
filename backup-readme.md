# MongoDB Backup Script

This script allows you to perform a backup of your MongoDB database and create a password-protected zip file for the backup. It uses the `mongodump` command to create the backup and the `zip` command to compress the backup into a zip file.

## Prerequisites

- MongoDB should be installed and running on your system.
- Ensure that you have the necessary permissions to access the MongoDB database.

## Usage

1. Open a terminal or command prompt.

2. Make sure you have execute permissions for the script. If not, you can grant the permissions using the following command:

   ```bash
   chmod +x script.sh
   ```

3. Modify the script variables according to your MongoDB setup:

   - `MONGO_HOST`: The hostname or IP address of your MongoDB server. By default, it is set to "localhost".

   - `MONGO_PORT`: The port on which MongoDB is running. By default, it is set to "27020".

   - `MONGO_USERNAME`: The username to authenticate with MongoDB. Modify this if your MongoDB requires authentication. By default, it is set to "test".

   - `MONGO_PASSWORD`: The password to authenticate with MongoDB. Modify this if your MongoDB requires authentication. By default, it is set to "test".

   - `MONGO_DATABASE`: The name of the database you want to backup. Modify this according to your database name. By default, it is set to "test".

   - `BACKUP_DIR`: The directory where you want to store the backup files. Modify this to specify the desired directory path. By default, it is set to "/home/alirezanqp/Desktop/mongo_backup/backups".

   - `ZIP_PASSWORD`: The password to protect the zip file. Modify this to set your desired password. By default, it is set to "66554422".

4. Run the script using the following command:

   ```bash
   ./script.sh
   ```

5. The script will perform the following steps:

   - Connect to the MongoDB server specified by `MONGO_HOST` and `MONGO_PORT`.
   - Authenticate with the MongoDB server using the provided `MONGO_USERNAME` and `MONGO_PASSWORD`.
   - Perform a backup of the specified `MONGO_DATABASE` using the `mongodump` command.
   - Compress the backup into a zip file using the `zip` command with the specified `ZIP_PASSWORD`.
   - Remove the temporary backup directory created during the process.

6. Once the backup is completed, the script will display the path to the created zip file.

## Scheduling Regular Backups

To schedule regular backups, you can use the cron utility on Linux systems. Cron allows you to automate the execution of tasks at specified intervals. Here's an example of how you can set up a cron job to run the backup script every 3 hours:

1. Open the cron configuration file by running the following command:

   ```bash
   crontab -e
   ```

2. If prompted, choose an editor to edit the crontab file.

3. Add the following line to the file:

   ```
   0 */3 * * * /path/to/script.sh
   ```

   Replace `/path/to/script.sh` with the actual path to the script on your system.

   This cron schedule expression will run the script every 3 hours, at the top of the hour (e.g., 1:00 AM, 4:00 AM, 7:00 AM, etc.).

4. Save the file and exit the editor.

The cron job is now set up, and the backup script will be executed automatically at the specified intervals. Make sure to review and update the script variables according to your
