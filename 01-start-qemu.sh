#!/bin/sh

url=https://uk.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-standard-3.22.1-x86_64.iso
filename=alpine.qcow2

if ! [ -f $(basename $url) ]; then
	curl -O ${url}
fi

if ! [ -f $filename ]; then
	qemu-img create -f qcow2 alpine.qcow2 16G
fi

qemu-system-x86_64 \
	-enable-kvm \
	-m 2048 \
	-nic user,model=virtio \
	-drive file=$filename,media=disk,if=virtio \
	-cdrom $(basename $url) \
	-display gtk \
	-cpu host \
	-vga qxl

