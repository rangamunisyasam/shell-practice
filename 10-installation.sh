#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
echo "Please run this script with root user access"
exit 1
fi

echo "Installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
echo "Installing nginx ... FAILURE"
exit1
else
echo "Installing nginx ... SUCCESS"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing mysql ... FAILURE"
    exit1
else
    echo "Installing mysql ... SUCCESS"
fi

dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Installing nodejs ... FAILURE"
    exit1
else
    echo "Installing nodejs ... SUCCESS"
fi
