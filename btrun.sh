#!/bin/bash

# Checking default params
LOGIN=${LOGIN:-admin}
PASSWORD=${PASSWORD:-password}

# Automating some btsync setup
/usr/bin/btsync --dump-sample-config > /usr/bin/btsync.conf

sed -i 's/"listening_port" : 0/"listening_port" : 55555/' /usr/bin/btsync.conf
sed -i 's/"storage_path" : "\/home\/user\/.sync"/"storage_path" : "\/btsync\/.sync"/' /usr/bin/btsync.conf
sed -i 's/"login" : "admin"/"login" : "'$LOGIN'"/' /usr/bin/btsync.conf
sed -i 's/"password" : "password"/"password" : "'$PASSWORD'"/' /usr/bin/btsync.conf

/usr/bin/btsync --nodaemon --config /usr/bin/btsync.conf
