#!/bin/bash
BASEDIR=$(dirname "$0")
echo Copyright 2017 By James Cozzi \(jcoz00\)
rm -r $BASEDIR/Packages
echo Removing Packages…
rm -r $BASEDIR/Packages.gz
echo Removing Packages.gz…
rm -r $BASEDIR/Packages.bz2
echo Removing Packages.bz2…&&
echo Scanning For New Packages… 
cd $BASEDIR
./dpkg-scanpackages Files /dev/null > Packages && gzip -c9 Packages > Packages.gz
echo Compressing Packages with gzip…
sleep 2
bzip2 -c9 Packages > Packages.bz2 &&
echo Compressing Packages with bzip2…
echo Done!