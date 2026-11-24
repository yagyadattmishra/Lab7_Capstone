
#!/bin/bash

# Linux System Administration & Automation Toolkit
# Main Module: Menu-Driven Dashboard

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

LOGDIR="$SCRIPT_DIR/sample_logs"

mkdir -p "$LOGDIR"

show_menu() {

    clear

    echo "=================================================="
    echo "       LINUX SYSTEM ADMINISTRATION TOOLKIT"
    echo "=================================================="

    echo ""
    echo "  1. System Monitoring Report"
    echo "  2. Create Backup"
    echo "  3. Restore Backup"
    echo "  4. Analyze Logs"
    echo "  5. Full Status Report"
    echo "  6. Exit"

    echo ""
    echo "=================================================="

}

while true
do

    show_menu

    read -r -p "Enter your choice: " choice

    case "$choice" in

        1)
            echo ""
            echo "Starting System Monitoring..."
            ./monitor.sh
            ;;

        2)
            echo ""
            read -r -p "Enter Source Directory: " source
            read -r -p "Enter Destination Directory: " destination

            ./backup.sh "$source" "$destination"
            ;;

        3)
            echo ""
            read -r -p "Enter Backup Archive Path: " archive
            read -r -p "Enter Restore Destination: " restore_path

            ./backup.sh "$archive" "$restore_path" restore
            ;;

        4)
            echo ""
            read -r -p "Enter Log File Path: " logfile

            ./log_analyzer.sh "$logfile"
            ;;

        5)
            echo ""
            echo "========== FULL SYSTEM STATUS =========="

            echo ""
            echo "1. SYSTEM MONITORING"
            ./monitor.sh

            echo ""
            echo "2. LOG ANALYSIS"

            if compgen -G "$LOGDIR/*.log" > /dev/null; then
                ./log_analyzer.sh "$LOGDIR"/*.log
            else
                echo "No log files available."
            fi

            echo ""
            echo "========== STATUS REPORT COMPLETED ======"

            ;;

        6)
            echo ""
            echo "Thank you for using Linux Admin Toolkit!"
            echo "Exiting..."
            break
            ;;

        *)
            echo ""
            echo "ERROR: Invalid choice! Please select 1-6."
            ;;

    esac

    if [ "$choice" != "6" ]; then
        echo ""
        read -r -p "Press Enter to return to Menu..."
    fi

done
