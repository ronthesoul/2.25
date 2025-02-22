#! /usr/bin/env bash
whoami
echo "Displayed currently logged-in user."

who
echo "Displayed all logged-in users."

w
echo "Displayed logged-in users with running commands."

su -l anotheruser
echo "Switched to another user account and back."

su - anotheruser
echo "Switched to another user account using 'su -' to load the full environment."

useradd testuser
echo "Tried to create a new user without sudo."

sudo useradd testuser
echo "Tried to create a new user with sudo. It should succeed."

