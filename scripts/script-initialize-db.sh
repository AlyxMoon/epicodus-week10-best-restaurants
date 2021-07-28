#!/bin/bash
cd "${0%/*}"

USE_A_PASSWORD=true

while getopts u:p:Pd: flag
do
    case "${flag}" in
        u) USER_NAME=${OPTARG};;
        p) USER_PASS=${OPTARG};;
        P) USE_A_PASSWORD=false;;
        d) DB_NAME=${OPTARG};;
    esac
done

USER_NAME="${USER_NAME:-root}"
USER_PASS="${USER_PASS:-epicodus}"
DB_NAME="${DB_NAME:-epicodus_week10_best_restaurants}"

echo "Running mysql as user: $USER_NAME"
if [ "$USE_A_PASSWORD" == true ]; then
  echo "Running mysql with pass: $USER_PASS"
else
  echo "Not using a password for mysql"
fi
echo "Will use the following database (creating if needed): $DB_NAME"

if [ "$USE_A_PASSWORD" == true ]; then
  mysql -u $USER_NAME -p=$USER_PASS -e "DROP DATABASE IF EXISTS $DB_NAME"
  mysql -u $USER_NAME -p=$USER_PASS -e "CREATE DATABASE $DB_NAME"
  mysql -u $USER_NAME -p=$USER_PASS $DB_NAME -e "source sql-create-tables.sql"
else
  mysql -u $USER_NAME -e "DROP DATABASE IF EXISTS $DB_NAME"
  mysql -u $USER_NAME -e "CREATE DATABASE $DB_NAME"
  mysql -u $USER_NAME $DB_NAME -e "source ./sql-create-tables.sql"
fi