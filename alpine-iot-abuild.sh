#!/bin/sh

# sudo apk add alpine-sdk

set -e

PACKAGE="
	hts_engine htsvoice-mei open_jtalk
	libftdi1 avrdude
	binutils-avr gcc-avr avr-lib
	"

for dir in $PACKAGE; do
	echo "$dir: building..."
	cd $dir
	abuild checksum
	abuild -r
	cd ..
done

