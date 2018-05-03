#!/bin/sh

# sudo apk update
# sudo apk upgrade
# sudo apk add alpine-sdk

set -e

PACKAGE="
	hts_engine htsvoice-mei open_jtalk 
	libftdi1 avrdude 
	binutils-avr gcc-avr avr-libc 
	micronucleus digispark
	php5
	linux-iot
	"

for dir in $PACKAGE; do
	echo "$dir: building..."
	cd $dir
	abuild checksum
	abuild -r
	cd ..
done

