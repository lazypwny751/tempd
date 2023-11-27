#!/bin/sh

set -e

export status="true"

if ! command -v "mkdir" ; then
	echo "command: \"mkdir\" not found, please install that dependency."
	export status="false"
fi

if ! "${status}" ; then
	make missing
fi
