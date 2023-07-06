# File Cleanup Script

This script allows you to perform cleanup of files in a specified directory that are older than 30 days. It uses the `find` command to locate files based on their creation date and the `rm` command to delete the files.

## Usage

1. Open a terminal or command prompt.

2. Make sure you have execute permissions for the script. If not, you can grant the permissions using the following command:

   ```bash
   chmod +x script.sh
   ```

3. Modify the script according to your setup:

   - `directory`: Set the path to the directory where you want to perform the file cleanup. Modify this according to your desired directory path.

4. Run the script using the following command:

   ```bash
   ./script.sh
   ```

5. The script will perform the following steps:

   - Calculate the timestamp for files that were created 30 days ago using the `date` command.

   - Find files in the specified directory that were created 30 days ago or earlier using the `find` command.

   - Delete the found files using the `rm` command.

## Scheduling the Cleanup Process

To schedule the cleanup process to run every night, you can use the cron utility on Linux systems. Cron allows you to automate the execution of tasks at specified intervals. Here's an example of how you can set up a cron job to run the cleanup script every night:

1. Open the cron configuration file by running the following command:

   ```bash
   crontab -e
   ```

2. If prompted, choose an editor to edit the crontab file.

3. Add the following line to the file:

   ```
   0 0 * * * /path/to/script.sh
   ```

   Replace `/path/to/script.sh` with the actual path to the script on your system.

   This cron schedule expression will run the script every night at midnight (00:00).

4. Save the file and exit the editor.

The cron job is now set up, and the file cleanup script will be executed automatically every night. Make sure to review and update the script and cron configuration according to your setup.

Please note that the provided cron schedule assumes the server's system time is set to UTC. If your system time is set to a different timezone, you may need to adjust the cron expression accordingly.

Remember to regularly monitor the cleanup process and verify that the desired files are being deleted successfully.
