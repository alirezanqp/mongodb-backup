#!/bin/bash
/usr/local/bin/aws s3 sync --endpoint-url https://storage.iran.liara.space/ /root/mongo_backup/backups s3://bucket_name
