#!/usr/bin/env bash 

sudo groupadd sports 2>/dev/null || echo "Group already exits"
sudo mkdir ./sports_dir
sudo chown :sports ./sports_dir
sudo chmod 2770 ./sports_dir
ls -ld ./sports_dir


echo "Testing file creation as sports group member"
sudo usermod -aG sports $(whoami)
touch ./sports_dir/testfile
ls -l ./sports_dir/testfile


sudo -u $(whoami) touch ./sports_dir/myfile
sudo -u nobody touch ./sports_dir/nobodyfile
ls -l ./sports_dir
sudo -u $(whoami) rm -f ./sports_dir/nobodyfile 2>/dev/null && echo "Delete successful" || echo "Delete failed as expected"
