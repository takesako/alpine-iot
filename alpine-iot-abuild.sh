#!/bin/sh

# sudo apk add alpine-sdk

set -e

PACKAGE="
	hts_engine htsvoice-mei open_jtalk
	libftdi1 avrdude
	"

for dir in $PACKAGE; do
	echo "$dir: building..."
	cd $dir
	abuild checksum
	abuild -r
	cd ..
done

