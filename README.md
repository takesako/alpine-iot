# alpine-iot
Alpine Linux packages for IoT tools
- apk binary packages
  - http://1ot.jp/alpine-iot/
- APKBUILD sources
  - http://github.com/takesako/alpine-iot/

## Provided apk packages (alpine-iot)
1. open_jtalk (hts_engine, htsvoice-mei, mecab-naist-jdic) x86, x86_64, armhf
2. avrdude (libftdi1) x86, x86_64, armhf
3. avr-libc (binutils-avr, gcc-avr) x86, x86_64, armhf
4. micronucleus (libusb-comapt) x86, x86_64, armhf

## How to abuild (for alpine-iot maintainers)
### setup
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
### build
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
# cd binutils-avr; abuild checksum && abuild -r; cd ..
# cd gcc-avr     ; abuild checksum && abuild -r; cd ..
# cd avr-libc    ; abuild checksum && abuild -r; cd ..
# cd micronucleus; abuild checksum && abuild -r; cd ..
# ...
```
## How to apk add (for Alpine Linux users)
### setup
```
echo "http://1ot.jp/alpine-iot" >> /etc/apk/repositories
wget -P /etc/apk/keys http://1ot.jp/alpine-iot/keys/takesako@namazu.org-587ad2bb.rsa.pub
apk update
```
### install
```
apk add open_jtalk htsvoice-mei mecab-naist-jdic
apk add avrdude micronucleus
apk add avr-libc binutils-avr gcc-avr gcc-avr-dev
```

