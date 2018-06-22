#!/bin/sh

pkg install -y cdrtools ca_root_nss rsync

if [ ! -e FreeBSD-11.1-RELEASE-amd64-disc1.iso ]
then
 fetch https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-disc1.iso.xz
 xz -d ./FreeBSD-11.1-RELEASE-amd64-disc1.iso.xz
fi


if [ -e ./FreeBSD-11.1-RELEASE-bhyve64-autoinst.iso ]
then
 rm ./FreeBSD-11.1-RELEASE-bhyve64-autoinst.iso
fi


PATCHED_IMG_DIR=`mktemp -d`
ORIG_IMG_DIR=`mktemp -d`

mdconfig -f ./FreeBSD-11.2-RC3-amd64-memstick.img -u 99
mount /dev/md1s2a $ORIG_IMG_DIR

rsync -aq $ORIG_IMG_DIR/ $PATCHED_IMG_DIR/

# make modifications
cp ./installerconfig $PATCHED_IMG_DIR/etc/installerconfig
cp ./rc.local $PATCHED_IMG_DIR/etc/rc.local




umount $ORIG_ISO_DIR
rm -rf $ORIG_ISO_DIR
rm -rf $PATCHED_ISO_DIR
