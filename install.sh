#!/bin/bash

# Required ENV Variables:
# DO_TOKEN      - API Access Token
# DO_DOMAIN     - Domain Name (eg. example.com)
# DO_RECORD_ID  - Domain Record ID (eg. 553653)

cp -f digitalocean-ddns.timer /etc/systemd/system/
cp -f digitalocean-ddns.service /etc/systemd/system/
mkdir -p /opt/digitalocean-ddns/

cp -f update-dns-record.sh /opt/digitalocean-ddns/

chmod 700 /opt/digitalocean-ddns
chmod 600 /opt/digitalocean-ddns/update-dns-record.sh

sed -i "s/\$DO_TOKEN/$DO_TOKEN/g" /opt/digitalocean-ddns/update-dns-record.sh
sed -i "s/\$DO_DOMAIN/$DO_DOMAIN/g" /opt/digitalocean-ddns/update-dns-record.sh
sed -i "s/\$DO_RECORD_ID/$DO_RECORD_ID/g" /opt/digitalocean-ddns/update-dns-record.sh

systemctl enable digitalocean-ddns.service
systemctl enable --now digitalocean-ddns.timer
