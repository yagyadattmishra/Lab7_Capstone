
#!/bin/bash

# Linux System Administration & Automation Toolkit
# Module 3: Log Analyzer

echo "================================================"
echo "             LINUX LOG ANALYZER"
echo "================================================"

if [ $# -eq 0 ]; then
    echo "Usage: ./log_analyzer.sh FILE1 [FILE2 ...]"
    exit 1
fi

TOTAL_ERRORS=0
TOTAL_WARNINGS=0
TOTAL_CRITICAL=0
TOTAL_FATAL=0
TOTAL_LINES=0
VALID_FILES=0

for FILE in "$@"
do

    if [ ! -f "$FILE" ]; then
        echo ""
        echo "ERROR: File not found: $FILE"
        continue
    fi

    VALID_FILES=$((VALID_FILES + 1))

    ERRORS=$(grep -ci "ERROR" "$FILE")
    WARNINGS=$(grep -ci "WARNING" "$FILE")
    CRITICAL=$(grep -ci "CRITICAL" "$FILE")
    FATAL=$(grep -ci "FATAL" "$FILE")
    LINES=$(wc -l < "$FILE")

    echo ""
    echo "--------------- FILE REPORT ----------------"
    echo "File Name: $FILE"
    echo "Total Lines: $LINES"
    echo "Errors: $ERRORS"
    echo "Warnings: $WARNINGS"
    echo "Critical: $CRITICAL"
    echo "Fatal: $FATAL"

    echo ""
    echo "--------------- MATCHED LOGS ---------------"

    grep -inE "ERROR|WARNING|CRITICAL|FATAL" "$FILE" || echo "No issues found."

    TOTAL_ERRORS=$((TOTAL_ERRORS + ERRORS))
    TOTAL_WARNINGS=$((TOTAL_WARNINGS + WARNINGS))
    TOTAL_CRITICAL=$((TOTAL_CRITICAL + CRITICAL))
    TOTAL_FATAL=$((TOTAL_FATAL + FATAL))
    TOTAL_LINES=$((TOTAL_LINES + LINES))

done

echo ""
echo "================================================"
echo "               FINAL SUMMARY"
echo "================================================"

echo "Files Analyzed: $VALID_FILES"
echo "Total Log Lines: $TOTAL_LINES"
echo "Total Errors: $TOTAL_ERRORS"
echo "Total Warnings: $TOTAL_WARNINGS"
echo "Total Critical: $TOTAL_CRITICAL"
echo "Total Fatal: $TOTAL_FATAL"

echo "================================================"
echo "           LOG ANALYSIS COMPLETED"
echo "================================================"

if [ "$VALID_FILES" -eq 0 ]; then
    exit 1
fi

