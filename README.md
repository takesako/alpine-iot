# alpine-iot
Alpine Linux packages for IoT tools
- apk binary packages
  - https://www.10t.dev/alpine-iot/
- APKBUILD sources
  - https://github.com/takesako/alpine-iot/

## Provided apk packages (alpine-iot)
1. micronucleus (libusb-compat) x86_64, aarch64

## How to apk add (for Alpine Linux users)
### setup
```
echo "https://www.10t.dev/alpine-iot/v3.19" >> /etc/apk/repositories
wget -P /etc/apk/keys https://www.10t.dev/alpine-iot/keys/takesako@namazu.org-587ad2bb.rsa.pub
apk update
```
### install
```
apk add micronucleus
```
### setuid for libusb
```
chmod u+s /usr/bin/micronucleus
```

## How to abuild (for alpine-iot maintainers)
### setup
```
vi /etc/apk/repositories
# http://dl-cdn.alpinelinux.org/alpine/v3.7/community
apk update
apk add alpine-sdk
apk add rsync
adduser $YOURNAME
addgroup $YOURNAME abuild
vi /etc/abuild.conf
# PACKAGER="YOUR NAME <YOUR@EMAIL>"
visudo
# echo "$YOURNAME ALL=NOPASSWD: ALL" >> /etc/sudoers
login $YOURNAME
abuild-keygen -a -i
# ls -al ~/.abuild/
# sudo cp -p ~/.abuild/*.pub /etc/apk/keys/
```

### build
```
mkdir aports
cd aports
git clone https://github.com/takesako/alpine-iot.git
# git clone git@github.com:takesako/alpine-iot.git
cd alpine-iot
cd v3.5
./alpine-iot-abuild.sh
# cd hts_engine  ; abuild checksum && abuild -r; cd ..
# cd htsvoice-mei; abuild checksum && abuild -r; cd ..
# cd open_jtalk  ; abuild checksum && abuild -r; cd ..
# cd libftdi1    ; abuild checksum && abuild -r; cd ..
# cd avrdude     ; abuild checksum && abuild -r; cd ..
# cd binutils-avr; abuild checksum && abuild -r; cd ..
# cd gcc-avr     ; abuild checksum && abuild -r; cd ..
# cd avr-libc    ; abuild checksum && abuild -r; cd ..
# cd micronucleus; abuild checksum && abuild -r; cd ..
# ...
```

