#!/usr/bin/env bash


echo "Setting password for serena to hunter2"
echo "serena:hunter2" | sudo chpasswd

echo "Setting password for venus and locking venus account"
echo "venus:hunter2" | sudo chpasswd
sudo usermod -L venus
grep "^venus" /etc/shadow

echo "Disabling serena password"
sudo passwd -d serena
grep "^serena" /etc/shadow

echo "Changing password of serena to 'serena'"
echo "serena:serena" | sudo chpasswd

echo "Forcing serena to change password in 10 days"
sudo chage -M 10 serena
sudo chage -l serena | grep "Maximum"

echo "Forcing all new users to change password in 10 days"
echo "PASS_MAX_DAYS 10" | sudo tee -a /etc/login.defs

echo "Backing up /etc/shadow and copying hunter2 hash from venus to serena"
sudo cp /etc/shadow /etc/shadow.bak
sudo grep "^venus" /etc/shadow | cut -d: -f2 | while read -r hash; do
    sudo sed -i "s|^serena:[^:]*|serena:$hash|" /etc/shadow
done
sudo chmod 400 /etc/shadow
echo "Check if serena can log in with hunter2 now"

echo "Listing all available shells"
chsh -l
cat /etc/shells

echo "Checking which useradd option allows naming a home directory"
man useradd | grep -A 3 -- "-d"

echo "Checking if serena's password is locked using grep"
grep "^serena" /etc/shadow

echo "Checking if serena's password is locked using passwd"
sudo passwd -S serena
