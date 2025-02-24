#!/usr/bin/env bash

whoami
echo "Displayed currently logged-in user."

who
echo "Displayed all logged-in users."

w
echo "Displayed logged-in users with running commands ."

# Corrected variable assignment (no spaces around =)
prev_user=$(whoami)

sudo useradd -m anotheruser || echo "User already exists"
sudo passwd -d anotheruser
su - anotheruser -c "whoami; echo 'Running as anotheruser'"
echo "Switched to another user account."

# Switch back to the previous user
su - "$prev_user"

# Try to create a new user without sudo
useradd testuser 2>/dev/null || echo "Failed to create 'testuser' without sudo."

# Create a new user with sudo
sudo useradd testuser && echo "'testuser' created successfully with sudo."
