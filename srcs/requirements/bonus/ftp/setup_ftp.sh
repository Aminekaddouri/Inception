#!/bin/sh
set -e

# Create user if not exists
if ! id -u "$FTP_USR" >/dev/null 2>&1; then
    adduser "$FTP_USR" --disabled-password --gecos "" --home /var/www/html
    echo "$FTP_USR:$FTP_PWD" | chpasswd
    echo "$FTP_USR" | tee -a /etc/vsftpd.userlist
fi

# Set permissions
chown -R "$FTP_USR:$FTP_USR" /var/www/html
chmod -R 755 /var/www/html

# Start vsftpd
echo "FTP started on :21"
exec vsftpd /etc/vsftpd/vsftpd.conf