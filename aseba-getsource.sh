#!/bin/sh

if test -d aseba/aseba; then
  echo "alreay fetched"
  exit 0
fi

# create build tree
mkdir -p aseba/build-dashel aseba/build-enki aseba/build-aseba
cd aseba
# fetch dashel
git clone git://github.com/aseba-community/dashel.git
# fetch enki
git clone git://github.com/enki-community/enki.git
# fetch aseba
git clone git://github.com/aseba-community/aseba.git
