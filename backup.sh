
#!/bin/bash

# Linux System Administration & Automation Toolkit
# Module 2: Backup and Restore

SOURCE="$1"
DESTINATION="$2"
ACTION="${3:-backup}"

if [ "$ACTION" = "restore" ]; then

    ARCHIVE="$SOURCE"

    if [ -z "$ARCHIVE" ] || [ ! -f "$ARCHIVE" ]; then
        echo "ERROR: Backup archive not found!"
        exit 1
    fi

    if [ -z "$DESTINATION" ]; then
        echo "Usage: ./backup.sh ARCHIVE DESTINATION restore"
        exit 1
    fi

    mkdir -p "$DESTINATION" || exit 1

    echo "Restoring backup..."

    if tar -xzf "$ARCHIVE" -C "$DESTINATION"; then
        echo "SUCCESS: Backup restored successfully!"
        echo "Restore Location: $DESTINATION"
    else
        echo "ERROR: Restore failed!"
        exit 1
    fi

else

    if [ -z "$SOURCE" ] || [ -z "$DESTINATION" ]; then
        echo "Usage: ./backup.sh SOURCE DESTINATION"
        exit 1
    fi

    if [ ! -d "$SOURCE" ]; then
        echo "ERROR: Source directory does not exist!"
        exit 1
    fi

    mkdir -p "$DESTINATION" || exit 1

    if [ ! -d "$DESTINATION" ]; then
        echo "ERROR: Destination directory is invalid!"
        exit 1
    fi

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_FILE="$DESTINATION/backup_$TIMESTAMP.tar.gz"

    echo "Starting backup..."
    echo "Source: $SOURCE"
    echo "Destination: $DESTINATION"

    if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
        echo ""
        echo "SUCCESS: Backup created successfully!"
        echo "Backup File: $BACKUP_FILE"
        ls -lh "$BACKUP_FILE"
    else
        echo "ERROR: Backup creation failed!"
        exit 1
    fi

fi
