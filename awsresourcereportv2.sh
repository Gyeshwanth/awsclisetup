#!/bin/bash
###difference push each everytime only difference##
#############
# Author : Yeshwanth
# Date   : 08-April-25
# Version: v2
# Purpose: This script will report the AWS resource usage
#############

REPORT_FILE="aws_report_$(date +%F_%T).log"

# AWS S3 Buckets
echo "===== S3 Buckets =====" >> "$REPORT_FILE"
aws s3 ls >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# EC2 Instances
echo "===== EC2 Instances =====" >> "$REPORT_FILE"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Lambda Functions
echo "===== Lambda Functions =====" >> "$REPORT_FILE"
aws lambda list-functions >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# IAM Users
echo "===== IAM Users =====" >> "$REPORT_FILE"
aws iam list-users >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
