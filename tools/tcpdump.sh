#!/bin/sh
# daemonized-tcpdump: install scripts for Alpine Linux

# create the pcap save directory
mkdir -p /var/log/pcap
chmod 700 /var/log/pcap

# service script for daemonized-tcpdump
# for details see the following script: /lib/rc/sh/openrc-run.sh
cat<<'EOF'>/etc/init.d/tcpdump
#!/sbin/openrc-run
description="daemonized-tcpdump"
name=$RC_SVCNAME
procname=$name
command="/usr/sbin/tcpdump"
command_args=${TCPDUMP_OPTS:--U -w /var/log/pcap/`date +%Y%m%d_%H%M%S`.pcap}
command_background="yes"
start_stop_daemon_args=""
pidfile="/run/$RC_SVCNAME.pid"
EOF
chmod 755 /etc/init.d/tcpdump

# configuration for daemonized-tcpdump 
# for details see the directory: /etc/conf.d/*
cat<<'EOF'>/etc/conf.d/tcpdump
TCPDUMP_EXPR="tcp and not port 22" # port 80
TCPDUMP_PATH="/var/log/pcap"
TCPDUMP_DATE=`date +%Y%m%d_%H%M%S`
TCPDUMP_FILE=$TCPDUMP_PATH/$TCPDUMP_DATE.pcap
TCPDUMP_OPTS="-C 2048 -W 100 -U -w $TCPDUMP_FILE $TCPDUMP_EXPR"
EOF
chmod 644 /etc/conf.d/tcpdump

# remove and add services to and from runlevels
rc-update del tcpdump default
rc-update add tcpdump default

# /etc/init.d/<service> <start stop restart>
#  rc-service <service> <start stop restart>
rc-service tcpdump stop
rc-service tcpdump start

