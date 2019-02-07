#!/bin/sh

if [ -z "$1" ]; then
	printf "missing file\n" "$0"
	exit 1
fi

if [ -z "$FLUMP_TOKEN" ]; then
	printf "\$FLUMP_TOKEN not set\n"
	exit 1
fi

if [ -z "$FLUMP_HOST" ]; then
	printf "\$FLUMP_HOST not set\n"
	exit 1
fi

curl -H "Accept: text/plain" \
	-H "Authorization: $FLUMP_TOKEN" \
	-F "file=@${1}" \
	"$FLUMP_HOST"
