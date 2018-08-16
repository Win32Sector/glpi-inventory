#!/usr/bin/env bash

#Script for installing fusioninventory agent on Ubuntu/Debian

cd /tmp

# Install dependencies:
apt -y install wget dmidecode hwdata ucf hdparm perl libuniversal-require-perl \
libwww-perl libparse-edid-perl libproc-daemon-perl libfile-which-perl libxml-treepp-perl \
libyaml-perl libnet-cups-perl libnet-ip-perl libdigest-sha-perl libsocket-getaddrinfo-perl \
libtext-template-perl nmap libnet-snmp-perl libcrypt-des-perl libnet-nbname-perl

# Download and install fusioninventory aget

wget http://debian.fusioninventory.org/downloads/fusioninventory-agent_2.4-2_all.deb

dpkg -i fusioninventory-agent_2.4-2_all.deb

# Configuring agent

sed -i 14d /etc/fusioninventory/agent.cfg
sed -i "14i server = http://glpi.gusadev.com/plugins/fusioninventory" /etc/fusioninventory/agent.cfg

sed -i 31d /etc/fusioninventory/agent.cfg
sed -i "31i delaytime = 60" /etc/fusioninventory/agent.cfg

systemctl start fusioninventory-agent
systemctl enable fusioninventory-agent
