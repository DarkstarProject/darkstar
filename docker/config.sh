#cp -ar ../conf/ .

DB_REPLACE='s/mysql_host:\s*127.0.0.1/mysql_host: dsdb/g'
#LOGIN_MSG_REPLACE='s/msg_server_ip:\s*127.0.0.1/msg_server_ip: */g'
MSG_REPLACE='s/msg_server_ip:\s*127.0.0.1/msg_server_ip: */g'

sed -i "$DB_REPLACE" conf/login_darkstar.conf
sed -i "$LOGIN_MSG_REPLACE" conf/login_darkstar.conf

sed -i "$DB_REPLACE" conf/map_darkstar.conf
sed -i "$MSG_REPLACE" conf/map_darkstar.conf

sed -i "$DB_REPLACE" conf/search_server.conf
