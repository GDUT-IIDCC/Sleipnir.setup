#!/bin/bash

# [typora] from https://www.typora.io/#linux
while true
do
	read -r -p "1. install typora? [y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
            sudo add-apt-repository 'deb https://typora.io/linux ./'
            sudo apt-get update
            sudo apt-get install typora
            break
			;;

	    [nN][oO]|[nN])
			break
			;;

	    *)
            echo "Invalid input..."
            ;;
	esac
done


# [v2rayA] from https://github.com/v2rayA/v2rayA/wiki/Usage
while true
do
	read -r -p "2. install v2rayA? [y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
            # curl -O https://cdn.jsdelivr.net/gh/v2rayA/v2rayA@master/install/go.sh
            # install v2ray-core from jsdelivr
            sudo bash go.sh
            # add public key
            wget -qO - https://apt.v2raya.mzz.pub/key/public-key.asc | sudo apt-key add -
            # add V2RayA's repository
            echo "deb https://apt.v2raya.mzz.pub/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
            sudo apt update
            # install V2RayA
            sudo apt install v2raya
            break
			;;

	    [nN][oO]|[nN])
			break
			;;

	    *)
            echo "Invalid input..."
            ;;
	esac
done
