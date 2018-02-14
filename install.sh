#!/bin/sh

if [[ $EUID > 0 ]]; then 
  echo "The installation script needs to be run as root."
  exit 1
fi

# Prefix by default
PREFIX="/usr/local"

# Detect OSX
if [[ `uname` == 'Darwin' ]]
then
    # Detect Macports
    if [[ -e /opt/local/libexec/gnubin ]]
    then
        PREFIX="/opt/local"
    fi
fi


BIN_DIR="$PREFIX/bin"
THIS_DIR=$(cd $(dirname $0); pwd)
echo "Installing from $THIS_DIR to: $BIN_DIR"
cp -f $THIS_DIR/apkx $THIS_DIR/apkx-libs.jar $THIS_DIR/enjarify.pex $BIN_DIR
chmod 755 $BIN_DIR/apkx $BIN_DIR/enjarify.pex

#rm -f /usr/local/bin/apkx /usr/local/bin/apkx-libs.jar /usr/local/bin/enjarify.pex