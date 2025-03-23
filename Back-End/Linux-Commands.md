# -- Linux Commands --

## general
```
su
sudo
cp
mv
rm
mkdir
cat
less
touch
who
echo
free
top
ps ux
du
df
date
exit
--help
man
pwd
ls
nano
```

## user
```
adduser
userdel
groupadd
usermod -a -G <namagroup> <namauser>
groupdel
```

## filesystem
```
(virtual disk)
dd if=/dev/zero of=virtualdisk.img bs=1M count=1000
losetup
sudo losetup loop0 virtualdisk.img

sudo losetup -d /dev/loop0
rm virtualdisk.img

(get disk info)
lsblk
sudo blkid

(manage partition)
sudo fdisk -l /dev/sda
sudo fdisk /dev/loop0

(manage partition)
sudo parted /dev/sda
sudo parted /dev/loop0

(format partition)
sudo mkfs.ext4 /dev/loop0p1

(etc)
df -h
file virtualdisk.img
file *
stat virtualdisk.img
```

## file permission
```
u (user)
g (group)
o (other) 
a (all)
+ (add permission)
- (remove permission)
= (add & remove permission)
r (read)
w (write)
x (execute)

--- (0)
--x (1)
-w- (2)
-wx- (3)
r-- (4)
r-x (5)
rw- (6)
rwx (7)

chmod [option] [ugoa][+-=][rwx] namafile
chmod u+x latihan
chmod 744 latihan
chown user:user latihan
chgrp groupsaya latihan
```

## file archiving
```
create options 
-c (create)
-x (extract)
-t (look into archive)
general options
-v (show all process)
-f (filename)
-p (save permission)
compressed options
-z (gzip)
-j (bzip)
-J (xz)

tar -cf <file.tar> <directory>
tar -tf <file.tar> <directory>
tar -xf <file.tar> <directory>
tar -czf arsip.tar.gz /etc
tar -xzf arsip.tar.gz
```