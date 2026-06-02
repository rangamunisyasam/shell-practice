#!/bin/bash

START_TIME=$(date +$s)

echo "script executed at: $START_TIME"

Sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in : $"TOTAL_TIME"
