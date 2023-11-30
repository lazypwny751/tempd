#!/bin/sh

set -e

export status="true"

if ! command -v "mkdir" ; then
	echo "command: \"mkdir\" not found, trying to get.."
	if [ ! -d "missing/lazyutils" ] ; then
		git clone "https://github.com/lazypwny751/lazyutils.git" "missing/lazyutils"
	fi
	export status="false"
fi

if ! "${status}" ; then
	make missing
fi
