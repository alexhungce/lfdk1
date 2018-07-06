#!/bin/bash

if [ ! -d bin ] ; then
	echo "Please run \"make\" to compile lfdk"
	exit 1
fi

if [ $EUID -gt 0 ] ; then
	echo "Please run as root"
	exit 1
fi

if [ $? -eq 0 ] ; then
	lsmod | grep lfdd_drv >> /dev/null || sudo insmod bin/lfdd_drv.ko
	sudo bin/lfdk
fi
