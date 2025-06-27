# DevOps Linux Commands

This document lists commonly used Linux commands for DevOps tasks, organized by category.

## File and Directory Operations
- `ls -lah` – List files with details (long format, all files, human-readable sizes).
- `cp source.txt destination.txt` – Copy files from source to destination.
- `mv oldname.txt newname.txt` – Move or rename a file.
- `rm -r folder/` – Delete a directory and its contents.
- `cat file.txt` – Display file contents.
- `touch newfile.txt` – Create an empty file.
- `find /home -name "*.txt"` – Search for files with `.txt` extension in `/home`.
- `tar -cvf archive.tar folder/` – Compress a directory into `archive.tar`.

## Network Management
- `ifconfig` or `ip a` – Display network interfaces.
- `hostname -I` – Show the system's IP address.
- `nmcli device show` – Display network details using NetworkManager CLI.

## Testing Connectivity
- `ping google.com` – Check network connectivity to a host.
- `traceroute google.com` – Trace the route to a host.
- `mtr google.com` – Real-time traceroute with network diagnostics.
- `nc -zv example.com 22` – Check if port 22 is open on `example.com`.
- `netstat -tulnp` – View active connections and listening ports.
- `ss -tulnp` – Show sockets and listening ports (modern alternative to `netstat`).
- `tcpdump -i eth0` – Capture network traffic on interface `eth0`.

## File Permissions
- `chmod 644 file.txt` – Set read/write for owner, read-only for group and others.
- `chmod 755 script.sh` – Set read/write/execute for owner, read/execute for group and others.
- `chmod u+x script.sh` – Add execute permission for the owner.
- `chmod g-w file.txt` – Remove write permission for the group.
- `chmod o+r file.txt` – Add read permission for others.

## Remote File Transfer
- `scp file.txt user@server:/path/` – Copy a file to a remote server.
- `scp user@server:/path/file.txt .` – Copy a file from a remote server to the current directory.
- `scp -r folder user@server:/path/` – Recursively copy a folder to a remote server.

## Process Management
- `pstree` – Display a tree of processes.
- `ps aux` – List all running processes with details.
- `top` – Real-time process monitoring.
- `htop` – Interactive process viewer (requires installation).

## Disk and Partition Management
- `lsblk` – List all block storage devices.
- `fdisk -l` – Show disk partitions (requires root).
- `blkid` – Display UUIDs of partitions.
- `parted -l` – View partition details.
- `mkfs.ext4 /dev/sdb1` – Format a partition with ext4 filesystem.

## Mounting and Unmounting Storage
- `mount /dev/sdb1 /mnt/data` – Mount a disk to `/mnt/data`.
- `umount /mnt/data` – Unmount a storage device from `/mnt/data`.
