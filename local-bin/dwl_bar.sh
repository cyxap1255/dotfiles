#!/bin/bash

while true; do
    date_time=$(date +"%H:%M:%S")
    ram_usage=$(LC_ALL=C free -h | awk '/Mem:/ {print $3 "/" $2}')
    cpu_usage=$(LC_ALL=C top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')
    network=$(LC_ALL=C ip route show default | awk '{print $5}')

    echo " $cpu_usage |  $ram_usage |  $network |  $date_time" > /tmp/dwl-bar

    sleep 1
done
