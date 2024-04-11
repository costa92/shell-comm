#!/usr/bie/env bash

# Path: lib/util.sh
function soft::util::sudo() {
	echo $1
	echo ${LINUX_PASSWORD} | sudo -S $1
}
