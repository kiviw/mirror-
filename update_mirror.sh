#!/bin/bash

# Download the mirrorlist file
wget -O mirrorlist.txt http://mirrors.ubuntu.com/mirrorlist.txt

# Extract the first available mirror from the list
mirror_url=$(grep -o -m 1 '^deb [^ ]*' mirrorlist.txt | sed 's/^deb //')

# Replace the existing mirror in /etc/apt/sources.list
sed -i "s|http://archive.ubuntu.com/ubuntu/|${mirror_url}|g" /etc/apt/sources.list

# Update the package lists
apt-get update

# Cleanup: Remove the downloaded mirrorlist file
rm mirrorlist.txt
