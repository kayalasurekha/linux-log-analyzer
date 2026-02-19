#!/bin/bash

LOG="sample_access.log"
REPORT="report.txt"

echo "Log Analysis Report" > $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "--------------------------" >> $REPORT

echo "Total Requests:" >> $REPORT
wc -l < $LOG >> $REPORT

echo "" >> $REPORT
echo "Total 500 Errors:" >> $REPORT
awk '$4 == 500' $LOG | wc -l >> $REPORT

echo "" >> $REPORT
echo "Top 5 IP Addresses:" >> $REPORT
awk '{print $1}' $LOG | sort | uniq -c | sort -nr | head -5 >> $REPORT

echo "" >> $REPORT
echo "Most Common Status Code:" >> $REPORT
awk '{print $4}' $LOG | sort | uniq -c | sort -nr | head -1 >> $REPORT

echo ""
echo "Report generated in report.txt"

