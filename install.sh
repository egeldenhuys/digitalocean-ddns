#!/bin/bash

# Required ENV Variables:
# DO_TOKEN      - API Access Token
# DO_DOMAIN     - Domain Name (eg. example.com)
# DO_RECORD_ID  - Domain Record ID (eg. 553653)

sudo cp -f digitalocean-ddns.timer /etc/systemd/system/
sudo cp -f digitalocean-ddns.service /etc/systemd/system/
sudo mkdir -p /opt/digitalocean-ddns/

sudo cp -f update-dns-record.sh /opt/digitalocean-ddns/

sudo chmod 600 /opt/digitalocean-ddns/update-dns-record.sh

sudo sed -i "s/\$DO_TOKEN/$DO_TOKEN/g" /opt/digitalocean-ddns/update-dns-record.sh
sudo sed -i "s/\$DO_DOMAIN/$DO_DOMAIN/g" /opt/digitalocean-ddns/update-dns-record.sh
sudo sed -i "s/\$DO_RECORD_ID/$DO_RECORD_ID/g" /opt/digitalocean-ddns/update-dns-record.sh

sudo systemctl enable digitalocean-ddns.service
sudo systemctl enable digitalocean-ddns.timer

sudo systemctl stop digitalocean-ddns.timer
sudo systemctl start digitalocean-ddns.timer
