#!/sbin/sh

# We use this shell script because the script will follow symlinks and
# different trees will use different binaries to supply the setenforce
# tool. Before M we use toolbox, M and beyond will use toybox. The init
# binary and init.rc will not follow symlinks.

setenforce 0

mkdir -p /dev/block/platform/mtk-msdc.0/by-name/
busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/ /dev/block/platform/mtk-msdc.0/by-name/
