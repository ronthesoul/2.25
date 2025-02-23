#!/usr/bin/env bash 

echo "Creating directory ~/permissions and a file owned by the user..."
mkdir -p ~/permissions && touch ~/permissions/userfile
echo "Directory and file created."

echo "Copying a root-owned file from /etc/ to ~/permissions..."
sudo cp /etc/passwd ~/permissions/rootfile
echo "Checking ownership of copied file..."
ls -l ~/permissions/rootfile

echo "Changing ownership of all files in ~/permissions to user..."
sudo chown -R $USER:$USER ~/permissions
echo "Updated ownership:"
ls -l ~/permissions

echo "Setting permissions to allow user full rights, others can only read..."
chmod 744 ~/permissions/*
echo "Updated permissions:"
ls -l ~/permissions

echo "Displaying umask in octal and symbolic form..."
umask -p
echo "Setting umask to 077 using symbolic format..."
umask u=rwx,g=,o=
echo "Verifying new umask..."
umask

echo "Creating a file as user with read-only permission for others..."
touch ~/permissions/user_readonly_file && chmod 744 ~/permissions/user_readonly_file
echo "Checking if another normal user can read it..."
su - otheruser -c "cat ~/permissions/user_readonly_file"

echo "Checking if root can read and write the user-created file..."
sudo cat ~/permissions/user_readonly_file
sudo vi ~/permissions/user_readonly_file

echo "Creating a group-writable directory where users can only delete their own files..."
sudo groupadd testgroup
sudo mkdir /shared_group_dir
sudo chown :testgroup /shared_group_dir
sudo chmod 2770 /shared_group_dir
echo "Directory created with correct permissions."
