#!/bin/bash

echo "====>generate mysql jdbc connect script..."

cat >/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/jdbc.properties <<EOF
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc\:mysql\://$MYSQL_DB_HOST\:$MYSQL_DB_PORT/wcp?useUnicode=true&characterEncoding=utf-8
jdbc.username=$MYSQL_DB_USER
jdbc.password=$MYSQL_DB_PASSWORD
EOF

catalina.sh run
