#!/bin/bash

IP=`curl -s ifconfig.co`

curl -s -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" \
-d "{\"data\":\"$IP\"}" "https://api.digitalocean.com/v2/domains/$DO_DOMAIN/records/$DO_RECORD_ID"
