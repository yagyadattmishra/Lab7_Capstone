
# Linux System Administration & Automation Toolkit

## Student Information

Name: Yagya Datt Mishra
Roll No: 2601560001
Subject: Linux System & Shell Scripting

## Project Overview

This project is a Linux-based system administration
and automation toolkit developed using Bash scripting.

It integrates system monitoring, backup and restore,
log analysis and a menu-driven dashboard.

## Modules

1. System Monitoring
   - CPU usage
   - Memory usage
   - Disk usage
   - System uptime

2. Backup and Restore
   - Compressed TAR backup
   - Backup verification
   - File restoration
   - Error handling

3. Log Analyzer
   - ERROR detection
   - WARNING detection
   - CRITICAL detection
   - FATAL detection
   - Multiple log analysis

4. Menu-Driven Dashboard
   - Centralized menu
   - Monitoring
   - Backup and Restore
   - Log analysis
   - Full status report

## Technologies Used

- Ubuntu Linux
- Bash Shell Scripting
- grep
- awk
- tar
- df
- free
- top
- Git and GitHub

## Project Structure

Lab7_Capstone/
├── README.md
├── monitor.sh
├── backup.sh
├── log_analyzer.sh
├── dashboard.sh
├── sample_logs/
├── backups/
├── reports/
└── test_data/

## How to Run

1. Open Ubuntu Terminal.
2. Navigate to project directory.
3. Give executable permissions:

   chmod +x *.sh

4. Run the dashboard:

   ./dashboard.sh

## Testing

- System monitoring test
- Backup creation test
- Backup restoration test
- Multiple log analysis test
- Empty log file test
- Invalid source directory test
- Invalid menu option test

## Conclusion

The project successfully integrates Linux
system administration and automation tasks
into a single menu-driven Bash toolkit.
