#!bin/bash

USERID=$(id -u)
LOGS-FOLDER="/var/log/shell-script"
LOGS-FILE="var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
echo -e "$R Please run this script with root user access $N" | tee -a $LOGS-FILE
exit 1
fi

mkdir -p $LOGS-FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ...  $R FAILURE $N" | tee -a $LOGS-FILE
        exit 1
    else
        echo -e "$2 ...  $G SUCCESS $N" | tee -a $LOGS-FILE
    fi
}

for package in $@   #sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf list installed $package &>> $LOGS-FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed. Installing now"
    dnf install $package -y &>> $LOGS-FILE
    VALIDATE $? "$package Installation"
    else
        echo -e  "$package already installed,  $Y skipping $N"
    fi    
done 