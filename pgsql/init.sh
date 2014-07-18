#!/bin/sh

touch /etc/sysconfig/network
if [[ ! -f /var/lib/pgsql/data/PG_VERSION ]]; then
    service postgresql initdb
    service postgresql start
    su - postgres -c "psql -w -c \
        \"ALTER USER postgres encrypted password 'pas4pgsql'\""
    service postgresql stop
    cat <<EOF >>/var/lib/pgsql/data/postgresql.conf
listen_addresses = '*'
EOF
    cat <<EOF >/var/lib/pgsql/data/pg_hba.conf
# TYPE DATABASE USER CIDR-ADDRESS METHOD
local all all md5
host all all 0.0.0.0/0 md5
host all all ::1/128 md5
EOF
fi

service postgresql start

while [[ true ]];do
    /bin/bash
done
