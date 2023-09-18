# vpnbot



### XTLS-Reality
- change secret
- qr/config
- change fake domain


### Wireguard
- create
- delete
- rename
- timer
- torrent blocking
- qr/config
- statistics


### Shadowsocks + v2ray
- change password
- on/off v2ray
- qr
- short link


### AdguardHome
- change password
- change upstream dns
- check dns


### PAC
- the ability to create your own PAC available by url with the ability to substitute the final ip and port


### MTProto
- change secret
- qr/config


### Settings
- add/change admin
- change language (en/ru)
- import/export all settings
- domain binding
- obtain ssl for domain


---
environment: ubuntu 18.04/20.04/22.04, debian 11

install:

`wget -O- https://raw.githubusercontent.com/Zelimkhan-P/vpnbot/main/scripts/init.sh | sh -s YOUR_TELEGRAM_BOT_KEY`

---

additional options:

install as service(autoload on start):

```
cd /root/vpnbot
bash scripts/install_as_service.sh
```
