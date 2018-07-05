#!/bin/bash
set -e

sudo mv -f /tmp/mongod.conf /etc/mongod.conf
sudo systemctl restart mongod
