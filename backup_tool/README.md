# Backup_tool 
The Backup Tool is a command-line utility written in Ruby for automating file backups. It allows users to schedule periodic backups or perform one-time backups, providing flexibility and ease of use.

## Features
- Scheduled Backups: Set up recurring backups based on a specified time interval.
- One-Time Backups: Perform manual backups as needed.
- Compression: Compress backed-up files to save storage space.
- Logging: Keep track of backup activities with detailed log messages.

## Prerequisites
- Ruby (version 3.0.1)
- Rufus-Scheduler gem

``` 
backup_tool/
│
├── backups/
│   ├── backups_log.txt
│
├── bin/
│   ├── backup_script.rb
│
├── config/
│   ├── config.yml
│
├── lib/
│   ├── backup.rb
│   ├── compression.rb
│   ├── logger.rb
│   ├── scheduler.rb
│
├── Gemfile
├── Gemfile.lock
├── README.md
└── .git/
    ├── ...
```