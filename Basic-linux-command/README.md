#DevOps-Training-Samarth
#linux command for Devops:
#Following are command which is used widely:

-------------------------------------------------------------------------------------------------
ls -lah – List files with details.

cp source.txt destination.txt – Copy files.

mv oldname.txt newname.txt – Move or rename a file.

rm -r folder/ – Delete a directory.

cat file.txt – View file contents.

touch newfile.txt – Create an empty file.

find /home -name "*.txt" – Search for files.

tar -cvf archive.tar folder/ – Compress a directory.

-----------------------------------------------------------------------------------------------------
ifconfig or ip a – Display network interfaces.

hostname -I – Show IP address.

nmcli device show – Network Manager CLI for network details.

2. Testing Connectivity

ping google.com – Check network connectivity.

traceroute google.com – Trace the route to a host.

mtr google.com – Real-time traceroute.

nc -zv example.com 22 – Check if a port is open.

netstat -tulnp – View active connections.

ss -tulnp – Show sockets and listening ports.

tcpdump -i eth0 – Capture network traffic.

------------------------------------------------------------------------------------------------------------
Changing File Permissions:


chmod 644 file.txt – Set read/write for owner, read-only for others.

chmod 755 script.sh – Give execute permission to everyone.

chmod u+x script.sh – Add execute permission for the owner.

chmod g-w file.txt – Remove write permission for the group.

chmod o+r file.txt – Give read permission to others.


---------------------------------------------------------------------------------------------------------------


scp file.txt user@server:/path/ – Copy a file to a remote server.

scp user@server:/path/file.txt . – Copy a file from a remote server.

scp -r folder user@server:/path/ – Recursively copy a folder.


--------------------------------------------------------------------------------------------------------------------

pstree --display tree of process

ps aux – List all running processes.

top – Display real-time process monitoring.

htop – Interactive process viewer (installable)

--------------------------------------------------------------------------------------------------------------------

1. Disk & Partition Management

lsblk – List all block storage devices.

fdisk -l – Show disk partitions.

blkid – Display UUIDs of partitions.

parted -l – View partition details.

mkfs.ext4 /dev/sdb1 – Format a partition with ext4.

2. Mounting & Unmounting Storage

mount /dev/sdb1 /mnt/data – Mount a disk to a directory.

umount /mnt/data – Unmount a storage device.

mount -o remount,rw / – Remount root as read-write.

-----------------------------------------------------------------------------------------------------------------------

