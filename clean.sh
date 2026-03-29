#!/bin/sh

PRJ_DIR=$(cd -- "$(dirname -- "$0")" && pwd)

printf "[clean.sh] Running..."
printf "[clean.sh] Entering project buildroot directory...\n"
cd "${PRJ_DIR}/buildroot" || { printf "Error: unable to access the buildroot directory!\n"; exit 1; }
printf "[clean.sh] Backing up current configuration...\n"
make savedefconfig BR2_DEFCONFIG="${PRJ_DIR}/base_external/aesd_qemu_defconfig.bak"
printf "[clean.sh] Running distclean...\n"
make distclean
printf "[clean.sh] Exiting buildroot directory...\n"
cd "${PRJ_DIR}"
printf "[clean.sh] Done. Backup saved to base_external/aesd_qemu_defconfig.bak\n"
