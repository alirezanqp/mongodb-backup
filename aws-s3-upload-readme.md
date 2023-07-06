# MongoDB Backup and Upload to AWS S3 Script

This script allows you to perform a backup of your MongoDB database and upload the backup files to an AWS S3 bucket. It uses the `aws` command-line tool to sync the backup files with the S3 bucket.

## Prerequisites

- MongoDB should be installed and running on your system.
- Ensure that you have the necessary permissions to access the MongoDB database.
- Set up an AWS account and create an S3 bucket to store the backup files.
- Install the AWS CLI and configure it with your AWS credentials. You can refer to the AWS CLI documentation for detailed instructions on installation and configuration.

## Usage

1. Open a terminal or command prompt.

2. Make sure you have execute permissions for the script. If not, you can grant the permissions using the following command:

   ```bash
   chmod +x upload.sh
   ```

3. Modify the script according to your setup:

   - `/usr/local/bin/aws`: Update the path to the `aws` command if it is different on your system.

   - `--endpoint-url https://storage.iran.liara.space/`: Modify the endpoint URL to match the S3 storage service provider you are using. The provided example assumes the use of Liara's S3-compatible storage service.

   - `/root/mongo_backup/backups`: Set the path to the directory where your MongoDB backups are stored. Modify this according to your desired backup directory.

   - `s3://bucket_name`: Replace `bucket_name` with the name of your AWS S3 bucket.

4. Run the script using the following command:

   ```bash
   ./upload.sh
   ```

5. The script will perform the following steps:

   - Sync the files in the specified backup directory with the specified S3 bucket using the `aws s3 sync` command.

6. Once the sync operation is completed, the backup files will be uploaded to the specified S3 bucket.

## Setting Up AWS Credentials and Configuration

To use the AWS CLI and authenticate with your AWS account, you need to set up your AWS credentials and configure the CLI. Here's a brief overview of the steps involved:

1. Install the AWS CLI by following the instructions provided in the AWS CLI documentation for your operating system.

2. Once the CLI is installed, open a terminal or command prompt and run the following command:

   ```bash
   aws configure
   ```

3. You will be prompted to enter your AWS Access Key ID and Secret Access Key. Provide the appropriate values for your AWS account. These keys can be generated and obtained from the AWS Management Console.

4. Next, you will be asked to specify the AWS region to use. Enter the desired region code (e.g., `us-east-1`, `eu-west-1`, etc.) for your S3 bucket.

5. Optionally, you can set the default output format for AWS CLI commands. You can choose from JSON, text, or table format.

6. Once you have completed the configuration, your AWS credentials will be stored in a secure location on your system, and you will be ready to use the AWS CLI.

## Scheduling Regular Backups

To schedule regular backups and uploads to AWS S3, you can use the cron utility on Linux systems. Cron allows you to automate the execution of tasks at specified intervals. Here's an example of how you can set up a cron job to run the backup and upload script every 24 hours:

1. Open the cron configuration file by running the following command:

   ```bash
   crontab -e
   ```

2. If prompted, choose an editor to edit the crontab file.

3. Add the following line to the file:

   ```bash
   0 0 * * * /path/to/upload.sh
   ```

Replace `/path/to/upload.sh` with the actual path to the script on your system.

This cron schedule expression will run the script every 24 hours, at midnight (00:00) each day.

4. Save the file and exit the editor.

The cron job is now set up, and the backup script will be executed automatically every 24 hours, uploading the backup files to the specified AWS S3 bucket. Make sure to review and update the script and AWS configuration according to your setup.

Please note that the provided cron schedule assumes the server's system time is set to UTC. If your system time is set to a different timezone, you may need to adjust the cron expression accordingly.

Remember to regularly monitor the backup process and verify that the backups are being uploaded to the AWS S3 bucket successfully.
