#!/bin/bash
# script which updates the system

echo "Updating repo cache" | cowsay -f tux | lolcat
echo ""
sudo apt update 

echo ""
echo "Upgrading packages"  | cowsay -f tux | lolcat
echo ""
sudo apt upgrade

echo ""
echo "Updating snap packages" | cowsay -f tux | lolcat
echo ""
sudo snap refresh

echo ""
echo "Updating flatpak packages" | cowsay -f tux | lolcat
echo ""
flatpak update
flatpak uninstall --unused
