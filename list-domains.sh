#!/bin/bash

# list-domains.sh <page>

curl -s -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" \
"https://api.digitalocean.com/v2/domains/$DO_DOMAIN/records?page=$1" | python -m json.tool
