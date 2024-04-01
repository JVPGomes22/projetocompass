#!/bin/bash

STATUS=$(systemctl status httpd | grep Active | awk -F":" '{print $2}' | cut -d" " -f2)
DATA=$(date +"%d/%m/%y - %H:%M:%S")

# Verifica se o arquivo "exemplo.txt" existe
if [ $STATUS = "inactive" ]; then
    echo "APACHE - ${DATA} Offline"  >> /nfs-aws/joao-victor/offline.txt
else
    echo "APACHE - ${DATA} Online" >> /nfs-aws/joao-victor/online.txt
fi
