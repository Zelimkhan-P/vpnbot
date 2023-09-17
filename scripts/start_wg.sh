INTERFACE=$(route | grep '^default' | grep -o '[^ ]*$')
if [ $(cat /etc/wireguard/wg0.conf | wc -c) -eq 0 ]
then
    PRIVATEKEY=$(wg genkey | tee /etc/wireguard/privatekey)
    echo "[Interface]" > /etc/wireguard/wg0.conf
    echo "PrivateKey = $PRIVATEKEY" >> /etc/wireguard/wg0.conf
    echo "Address = $ADDRESS" >> /etc/wireguard/wg0.conf
    echo "ListenPort = $WGPORT" >> /etc/wireguard/wg0.conf
else
    sed "s/ListenPort = [0-9]\+/ListenPort = $WGPORT/" /etc/wireguard/wg0.conf > change_port
    cat change_port > /etc/wireguard/wg0.conf
fi
iptables -t nat -A POSTROUTING --destination 10.10.0.5 -j ACCEPT
iptables -t nat -A POSTROUTING -o $INTERFACE -j MASQUERADE
wg-quick up wg0
cat /ssh/key.pub > /root/.ssh/authorized_keys
ssh-keygen -A
exec /usr/sbin/sshd -D -e "$@" &
if [ $(cat /pac.json | jq .blocktorrent) -eq 1 ]
then
    sh /block_torrent.sh
fi
if [ $(cat /pac.json | jq .exchange) -eq 1 ]
then
    sh /block_exchange.sh
fi
tail -f /dev/null