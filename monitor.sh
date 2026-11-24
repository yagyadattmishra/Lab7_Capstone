
#!/bin/bash

# Linux System Administration & Automation Toolkit
# Module 1: System Monitoring

echo "================================================"
echo "       LINUX SYSTEM MONITORING REPORT"
echo "================================================"

echo ""
echo "Report Date: $(date)"
echo "Hostname: $(hostname)"

echo ""
echo "--------------- CPU INFORMATION ----------------"

CPU_USAGE=$(top -bn1 | awk -F',' '/Cpu\(s\)/ {
    for(i=1;i<=NF;i++)
        if($i ~ / id/) {
            gsub(/[^0-9.]/,"",$i)
            print 100-$i
            exit
        }
}')

echo "CPU Usage: ${CPU_USAGE:-Unavailable}%"

echo ""
echo "--------------- MEMORY INFORMATION -------------"

free -h

TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/Mem:/ {print $3}')
FREE_MEM=$(free -m | awk '/Mem:/ {print $4}')

echo ""
echo "Total Memory: ${TOTAL_MEM} MB"
echo "Used Memory: ${USED_MEM} MB"
echo "Free Memory: ${FREE_MEM} MB"

echo ""
echo "--------------- DISK INFORMATION ---------------"

df -h /

echo ""
df -h / | awk 'NR==2 {
    print "Total Disk: " $2
    print "Used Disk: " $3
    print "Available Disk: " $4
    print "Disk Usage: " $5
}'

echo ""
echo "--------------- SYSTEM UPTIME ------------------"

uptime -p

echo ""
echo "--------------- SYSTEM HEALTH -----------------"

echo "CPU Usage: ${CPU_USAGE:-Unavailable}%"
echo "Memory Usage: ${USED_MEM:-Unavailable} MB"

echo ""
echo "================================================"
echo "       MONITORING REPORT COMPLETED"
echo "================================================"
