freebsd-autoinst
======

Entirely self-proficient.  Clone to a fresh freebsd machine, customize the installerconfig, and run ./patch_iso.sh.

Builds FreeBSD-11.2-RELEASE-bhyve64-autoinst.iso with the following proterties

- ssh enabled
- no password
- my public key
- ntp
- a single serial TTY
- auto UFS root disk
- DHCP on vtnet0
- hostname determined by the mac address of vtnet0.  aa:bb:cc:dd:ee:ff becomes host ddeeff
