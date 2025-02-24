#!/usr/bin/env bash
echo "Creates two txt files"
echo "This is winter." > winter.txt
echo "This is summer." > summer.txt
echo "Creates a symlink"
ln winter.txt hlwinter.txt
ls -li winter.txt summer.txt hlwinter.txt
find . -samefile winter.txt
ln -s summer.txt slsummer.txt
echo "Finding all files with inode number 2 stops after first ffind"
find / -inum 2 2>/dev/null -print -quit

echo "Checking symbolic links in /etc/init.d/, /etc/rc2.d/, /etc/rc3.d/"
ls -l /etc/init.d/ /etc/rc2.d/ /etc/rc3.d/ 2>/dev/null 
echo "Listing files in /lib with symbolic link information"
ls -l /lib 2>/dev/null
echo "Finding regular files in home directory that have more than one hard link"
find ~ -type f -links +1 2>/dev/null | head -n 2
