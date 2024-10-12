 #!/bin/bash
echo "MOUNTING"
sudo mount -t proc /proc /home/danneil/items/nfs/ubuntu_rootfs/proc
sudo mount -t sysfs /sys /home/danneil/items/nfs/ubuntu_rootfs/sys
sudo mount -o bind /dev /home/danneil/items/nfs/ubuntu_rootfs/dev
sudo mount -o bind /dev/pts /home/danneil/items/nfs/ubuntu_rootfs/dev/pts
sudo chroot /home/danneil/items/nfs/ubuntu_rootfs
