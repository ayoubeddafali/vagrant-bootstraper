
#!/bin/bash
set -e
IFNAME=$1
NODES_NUMBER=$2
IP=$3
IP_START=$4
ADDRESS="$(ip -4 addr show $IFNAME | grep "inet" | head -1 |awk '{print $2}' | cut -d/ -f1)"
sed -e "s/^.*${HOSTNAME}.*/${ADDRESS} ${HOSTNAME} ${HOSTNAME}.local/" -i /etc/hosts

# remove ubuntu-bionic entry
sed -e '/^.*ubuntu-bionic.*/d' -i /etc/hosts

# Update /etc/hosts about other hosts

for i in $(seq $NODES_NUMBER)
do
  echo "$IP$(($IP_START + $i))  node-$i" >> /etc/hosts
done 