# digitalocean-ddns
Script to periodically update the DNS records on DigitalOcean (default 10 minutes)

## Dependencies
- Curl
- Python for pretty print json
- Systemd for timer

## Install
1. Create DNS record
2. Create API token (Read + Write) at https://cloud.digitalocean.com/account/api
3. Find domain record id
```
export DO_TOKEN=abc123...
export DO_DOMAIN=example.com

./list-domains.sh [page]

export DO_RECORD_ID=445653

# Test
./update-dns-record
```
4. Install with `sudo ./install.sh`
    - Will copy `update-dns-record.sh` to `/opt/digitalocean-ddns/` and replace the ENV variables with the actual values
    - Will copy systemd unit and timer to `/etc/systemd/system/` and activate it
