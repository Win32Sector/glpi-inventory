#!/usr/bin/env bash

#Script for installing fusioninventory agent on Ubuntu/Debian

cd /tmp

# Download and install fusioninventory agent
yum install -y fusioninventory-agent fusioninventory-agent-task-inventory

# Configuring agent

sed -i 14d /etc/fusioninventory/agent.cfg
sed -i "14i server = http://glpi.gusadev.com/plugins/fusioninventory" /etc/fusioninventory/agent.cfg

sed -i 31d /etc/fusioninventory/agent.cfg
sed -i "31i delaytime = 60" /etc/fusioninventory/agent.cfg

# Restart agents

systemctl start fusioninventory-agent
systemctl enable fusioninventory-agent
