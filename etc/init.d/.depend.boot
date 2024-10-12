TARGETS = mountkernfs.sh hostname.sh mountdevsubfs.sh procps hwclock.sh checkroot.sh networking urandom mountnfs.sh bootmisc.sh mountall.sh checkfs.sh checkroot-bootclean.sh mountall-bootclean.sh mountnfs-bootclean.sh kmod
INTERACTIVE = checkroot.sh checkfs.sh
mountdevsubfs.sh: mountkernfs.sh
procps: mountkernfs.sh
hwclock.sh: mountdevsubfs.sh
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
networking: mountkernfs.sh urandom procps
urandom: hwclock.sh
mountnfs.sh: networking
bootmisc.sh: mountall-bootclean.sh mountnfs-bootclean.sh checkroot-bootclean.sh
mountall.sh: checkfs.sh checkroot-bootclean.sh
checkfs.sh: checkroot.sh
checkroot-bootclean.sh: checkroot.sh
mountall-bootclean.sh: mountall.sh
mountnfs-bootclean.sh: mountnfs.sh
kmod: checkroot.sh
