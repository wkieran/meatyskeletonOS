#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/jugos.kernel isodir/boot/jugos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "jugos" {
	multiboot /boot/jugos.kernel
}
EOF
grub-mkrescue -o jugos.iso isodir
