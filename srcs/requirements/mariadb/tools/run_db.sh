#!/bin/bash

mysqld_safe --datadir=/var/lib/mysql &

max_attempts=20
attempt=0

while ! mysqladmin ping --silent; do
    attempt=$((attempt + 1))
    
    if [ "$attempt" -ge "$max_attempts" ]; then
        echo "MariaDB did not respond after $max_attempts attempts. Exiting..."
        exit 1
    fi
    sleep 1
done

mysql <<EOF
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DB\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin shutdown

exec mysqld --datadir=/var/lib/mysql
