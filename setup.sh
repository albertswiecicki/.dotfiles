#!/bin/sh

# script responsible for seting up basic configuration

# set swappiness level
if grep -q vm.swappiness /etc/sysctl.conf
then
    echo swappiness is already set
    grep vm.swappiness /etc/sysctl.conf
else
    echo "vm.swappiness = 10" | sudo tee -a /etc/sysctl.conf
    echo swappiness has been set to 10
fi
