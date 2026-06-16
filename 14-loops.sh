#!bin/bash

USERID=$(id -u)
LOGS-FOLDER="/var/log/shell-script"
LOGS-FILE="var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
echo "Please run this script with root user access" | tee -a $LOGS-FILE
exit 1
fi

mkdir -p $LOGS-FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE" | tee -a $LOGS-FILE
        exit 1
    else
        echo "$2 ... SUCCESS" | tee -a $LOGS-FILE
    fi
}

for package in $@   #sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf install $package -y &>> $LOGS-FILE
    VALIDATE $? "$package Installation"
done 