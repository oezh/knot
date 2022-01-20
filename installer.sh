#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

set -e
touch /tmp/knotinstaller.log
LOG=/tmp/knotinstaller.log

if [ -n "$(command -v knot)" ]; then
	echo "Uninstalling existing versions..."
	echo ""
	rm /usr/local/bin/knot
	rm /usr/local/bin/unknot
fi

clear
echo "Installing dependencies..."
echo ""
# Debian / Ubuntu
if [ -n "$(command -v apt-get)" ]; then
	apt-get update -y >> $LOG 2>&1
	apt-get install -y p7zip-full >> $LOG 2>&1
	echo "Downloading Binaries..."
	echo ""
	wget https://git.zhconsultores.com/oswaldo/Knot/raw/branch/master/bin/Debian/knot >> $LOG 2>&1
	wget https://git.zhconsultores.com/oswaldo/Knot/raw/branch/master/bin/Debian/unknot >> $LOG 2>&1

elif [ -n "$(command -v pacman)" ]; then
	pacman -Sy  >> $LOG 2>&1
	pacman -S --noconfirm p7zip >> $LOG 2>&1
	echo "Downloading Binaries..."
	echo ""
	wget https://git.zhconsultores.com/oswaldo/Knot/raw/branch/master/bin/Manjaro/knot >> $LOG 2>&1
	wget https://git.zhconsultores.com/oswaldo/Knot/raw/branch/master/bin/Manjaro/unknot >> $LOG 2>&1

elif [ -n "$(command -v brew)" ]; then
	brew update  >> $LOG 2>&1
	brew install p7zip >> $LOG 2>&1
	echo "Downloading Binaries..."
	echo ""
	wget https://git.zhconsultores.com/oswaldo/Knot/raw/branch/master/bin/MacOS/knot >> $LOG 2>&1
	wget https://git.zhconsultores.com/oswaldo/Knot/raw/branch/master/bin/MacOS/unknot >> $LOG 2>&1

else
	echo "Dependency not found: [apt|pacman|brew]"
	exit 1;
fi

echo "Installing Binaries..."
chmod +x {knot,unknot}
mv {knot,unknot} /usr/local/bin/
echo ""
echo "DONE!"

