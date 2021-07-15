#!/bin/bash
# script which updates the system

echo "----"
echo "Updating repo cache"
echo "----"
echo ""
sudo apt update 

echo ""
echo "----"
echo "Upgrading packages"
echo "----"
echo ""
sudo apt upgrade

echo ""
echo "----"
echo "Updating snap packages"
echo "----"
echo ""
sudo snap refresh

echo ""
echo "----"
echo "Updating flatpak packages"
echo "----"
echo ""
flatpak update
flatpak uninstall --unused
