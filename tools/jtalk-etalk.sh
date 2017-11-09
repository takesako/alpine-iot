#!/bin/sh
# jtalk & etalk: install scripts for Alpine Linux

cat<<'EOF'>/usr/bin/jtalk
#!/bin/sh
# Usage: echo "123" | jtalk
nice -n 1 open_jtalk \
-x /usr/share/mecab-naist-jdic \
-m /usr/share/htvoice/mei/mei_normal.htsvoice \
-ow /dev/stdout /dev/stdin $@ | \
exec nice -n 19 sox -V0 -t wav /dev/stdin -b8 -c1 -r 8192 -t wav /dev/dsp
EOF
chmod 755 /usr/bin/jtalk

cat<<'EOF'>/usr/bin/etalk
#!/bin/sh
# Usage: echo "123" | etalk
nice -n 1 espeak --stdin --stdout $@ | \
nice -n 19 sox -V0 -t wav /dev/stdin -b8 -c1 -r 8192 -t wav /dev/dsp
EOF
chmod 755 /usr/bin/etalk

cat<<'EOF'>/etc/local.d/audio.start
#!/bin/sh
chmod a+rw /dev/dsp /dev/audio
EOF
chmod 755 /etc/local.d/audio.start

# remove and add services to and from runlevels
rc-update del local default
rc-update add local default

# /etc/init.d/<service> <start stop restart>
#  rc-service <service> <start stop restart>
rc-service local stop
rc-service local start

