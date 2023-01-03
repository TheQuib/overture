#!/bin/bash
# Automates the copy of a directory to a Backblaze B2 bucket
# Quinn Henry
# Ensure you've followed the tutorial to install and configure RClone for Backblaze here:
#  - https://quibtech.com/p/backup-linux-directories-to-backblaze-b2/

# Copy directory in current folder
# SYNTAX:
#   - rclone copy [directoryPath] [rcloneRemoteName]:[bucketName]/[bucketDirectoryPath]
rclone copy directory backblaze-testing:quib-testing/directory

# REPEAT FOR ANY OTHER DESIRED DIRECTORIES