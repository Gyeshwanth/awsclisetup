#!/bin/bash

# This script will report the AWS resource usage
# ###############################################

set -e
set -x

# Output report file
REPORT_FILE="aws_resource_report.txt"

# Start report
{
  echo "########################################"
  echo "# AWS Resource Report - $(date)"
  echo "########################################"
  echo

  echo ">>> S3 Buckets"
  aws s3 ls
  echo

  echo ">>> EC2 Instance IDs"
  aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'
  echo

  echo ">>> Lambda Functions"
  aws lambda list-functions
  echo

  echo ">>> IAM Users"
  aws iam list-users
  echo

  echo "########################################"
  echo "# End of Report"
  echo "########################################"
} >> "$REPORT_FILE"
