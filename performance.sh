#!/bin/bash

echo "Tested on Debian 10.9 4.19.0-16-amd64"  

sudo apt -y install linux-cpupower

cat << EOF | sudo tee /etc/systemd/system/cpupower.service
[Unit]
Description=CPU performance
[Service]
Type=oneshot
ExecStart=/usr/bin/cpupower -c all frequency-set -g performance
[Install]
WantedBy=multi-user.target
EOF

cat << EOF | sudo tee /etc/sysctl.conf
kernel.perf_event_max_sample_rate=31500
EOF



