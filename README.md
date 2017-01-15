# alpine-iot
Alpine Linux packages for IoT tools
- apk binary packages
  - http://1ot.jp/alpine-iot/
- APKBUILD sources
  - http://github.com/takesako/alpine-iot/

## Provided apk packages (alpine-iot)
1. open_jtalk (hts_engine, htsvoice-mei) x86, x86_64
2. avrdude (libftdi1) x86, x86_64
3. avr-libc (binutils-avr, gcc-avr) todo

## How to abuild (for alpine-iot maintainers)
```
apk add alpine-sdk
adduser $YOURNAME
addgroup $YOURNAME abuild
vi /etc/abuild.conf
# PACKAGER="YOUR NAME <YOUR@EMAIL>"
visudo
# echo "$YOURNAME ALL=NOPASSWD: ALL" >> /etc/sudoers
login $YOURNAME
```
```
mkdir aports
cd aports
git clone https://github.com/takesako/alpine-iot.git
# git clone git@github.com:takesako/alpine-iot.git
cd alpine-iot
./alpine-iot-abuild.sh
# cd hts_engine  ; abuild checksum && abuild -r; cd ..
# cd htsvoice-mei; abuild checksum && abuild -r; cd ..
# cd open_jtalk  ; abuild checksum && abuild -r; cd ..
# cd libftdi1    ; abuild checksum && abuild -r; cd ..
# cd avrdude     ; abuild checksum && abuild -r; cd ..
# ...
```
## How to apk add (for Alpine Linux users)
```
echo "http://1ot.jp/alpine-iot" >> /etc/apk/repositories
wget -P /etc/apk/keys http://1ot.jp/alpine-iot/keys/takesako@namazu.org-587ad2bb.rsa.pub
apk update
```
```
apk add avrdude
apk add open_jtalk
```
