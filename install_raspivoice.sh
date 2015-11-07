#!/bin/bash
if [ "$(whoami)" == "root" ]; then

    echo "Sorry, you should not run this command as root."
    echo "For example  NOT not used 'sudo' when you call this script"
    exit 1
fi

cd $HOME/bin
TAR_FILENAME=raspivoice_pi.tar

sudo apt-get install git

# Running on Ubuntu or Rasppberry Pi?
s1='Ubuntu'
s2=$(lsb_release -a)

echo $s2 | grep $s1  1>/dev/null 
if [ `echo $?` -eq 0 ]
then
	echo "Running on Ubuntu"
	TAR_FILENAME=raspivoice_ubuntu.tar											
else
	echo "Running on Raspberry Pi"
fi


if  test -s "$TAR_FILENAME" 
then 
    echo "Exctracting binaries from $TAR_FILENAME into $HOME/bin"
	tar xvf $TAR_FILENAME -C $HOME/bin
else
  echo "ERROR :  File not found : $TAR_FILENAME"
fi





