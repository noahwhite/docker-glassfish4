#!/usr/bin/env bash 

echo 127.0.0.1     `uname -n` >> /etc/hosts
asadmin start-domain
while [ 0 -eq 0 ]; do
	sleep 5m
done
