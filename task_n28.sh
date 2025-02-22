#! /usr/bin/env bash

sudo useradd -m -c "Serena Williams" serena
echo "Created user 'serena' with home directory and description."

sudo useradd -m -s /bin/bash -c "Venus Williams" venus
echo "Created user 'venus' with home directory, bash shell, and description."

grep -E "serena|venus" /etc/passwd /etc/shadow /etc/group
echo "Verified user entries in system files."

ls -ld /home/serena /home/venus
echo "Verified home directories were created."

sudo useradd -m -s /bin/date einstime
echo "Created user 'einstime' with /bin/date as login shell."

echo "Logging in with einstime will run /bin/date instead of a shell."

echo "Welcome to the system" | sudo tee /etc/skel/welcome.txt
echo "Ensured every new user will have welcome.txt in their home directory."

sudo useradd -m testuser; cat /home/testuser/welcome.txt; sudo userdel -r testuser
echo "Created and deleted a test user to verify setup."

grep "^serena" /etc/passwd
sudo usermod -s /bin/bash serena
grep "^serena" /etc/passwd
echo "Changed default login shell for 'serena' to /bin/bash and verified before and after."
