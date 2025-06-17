#!/bin/bash

# Путь к ключу ssh (если нужен)
SSH_KEY="/home/ubuntu/aws_login.pem"

# Исходный каталог на удалённом сервере
SRC="kuvat@52.23.248.123:/var/www/aptly/lab/"

# Целевой локальный каталог
DST="/srv/repo/lab/"

# Файл для логов
LOG="/var/log/rsync_lab.log"

# Текущая дата для логов
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Starting rsync..." >> $LOG

# Запуск rsync
rsync -avz --delete -e "ssh -i $SSH_KEY -p 1870" "$SRC" "$DST" >> $LOG 2>&1

if [ $? -eq 0 ]; then
    echo "[$DATE] Rsync completed successfully." >> $LOG
else
    echo "[$DATE] Rsync failed!" >> $LOG
fi
