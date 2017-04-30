#!/bin/sh

cd aseba

if test -d aseba; then
  echo "git pull origin"
  # pull and compile dashel
  cd dashel
  git pull origin
  cd ..
  # pull and compile enki
  cd enki
  git pull origin
  cd ..
  # pull aseba
  #git pull origin && git checkout release-1.5.x && git submodule update --init && cd ..
  git pull origin && git submodule update --init && cd ..
else
  # create build tree
  mkdir -p aseba/build-dashel aseba/build-enki aseba/build-aseba
  cd aseba
  # fetch dashel
  git clone git://github.com/aseba-community/dashel.git
  # fetch enki
  git clone git://github.com/enki-community/enki.git
  # fetch aseba
  git clone git://github.com/aseba-community/aseba.git
