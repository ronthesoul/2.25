#!/usr/bin/env bash

echo "Creating groups: tennis, foot, and sports..."
sudo groupadd tennis 2>/dev/null || echo "Group tennis already exists"
sudo groupadd football 2>/dev/null || echo "Group football already exists"
sudo groupadd sports 2>/dev/null || echo "Group sports already exists"

grep -q "^football:" /etc/group && sudo groupmod -n foot football || echo "Group football does not exist, skipping rename."
echo "Groups created and renamed."


echo "Adding venus to tennis and sports..."
sudo usermod -aG tennis,sports venus 2>/dev/null || echo "User venus does not exist"
echo "Venus added to groups."


echo "Adding serena to tennis group..."
sudo usermod -aG tennis serena 2>/dev/null || echo "User serena does not exist"
echo "Serena added to tennis group."

echo "Verifying serena's membership in tennis..."
id serena || echo "User serena does not exist"

sudo usermod -aG foot,sports serena && echo "Added user serena to sports and foot" || echo "Failed to add them to the group"
sudo gpasswd -A serena sports && echo "Made serena the manger if sports" || echo "Failed to add serena to be the manger of sports"
sudo gpasswd -A serena foot && echo "Made serena the manager if foot" || echo "Failed to add serena to be the manger of foot"
echo "Manager assigned to both groups".
echo "The owner of the foot group is:" $(sudo grep '^foot:' /etc/gshadow | cut -d ':' -f4)
echo "The owner of the sports group is:"$(sudo grep '^sports:' /etc/gshadow | cut -d ':' -f4)

