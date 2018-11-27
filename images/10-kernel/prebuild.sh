#!/bin/bash
set -ex

# linux-${KERNEL_VERSION}-${KERNEL_ARCH}.tar

VMLINUX_FILE="./boot/vmlinuz-${KERNEL_VERSION}"
if [ ! -e "${VMLINUX_FILE}" ]; then
    VMLINUX_FILE="./boot/vmlinux-${KERNEL_VERSION}"
fi

tar -xf /source/dist/kernel/linux-${KERNEL_VERSION}-${KERNEL_ARCH}.tar.gz ${VMLINUX_FILE} ./boot/System.map-${KERNEL_VERSION}
mv ${VMLINUX_FILE} ./images/10-kernel/kernel
mv ./boot/System.map-${KERNEL_VERSION} ./images/10-kernel/System.map
rmdir boot

cp /source/dist/kernel/linux-${KERNEL_VERSION}-${KERNEL_ARCH}.tar.gz ./images/10-kernel/kernel.tar.gz
gunzip -f ./images/10-kernel/kernel.tar.gz

ls -lah ./images/10-kernel
