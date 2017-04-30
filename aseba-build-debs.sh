
# dpkg-buildpackage -uc -tc
cd aseba
# build Dashel package and install it
cd dashel
sudo mk-build-deps -i         # install dependencies
debuild -i -us -uc -b         # build package
cd ..
sudo dpkg -i libdashel*.deb   # install package
# build Enki package and install it
cd enki
sudo mk-build-deps -i         # install dependencies
debuild -i -us -uc -b         # build package
cd ..
sudo dpkg -i libenki*.deb     # install package
# build Aseba package
cd aseba
sudo mk-build-deps -i         # install dependencies
debuild -i -us -uc -b         # build package
cd ..
# remove libdashel and libenki
sudo apt-get -y remove libdashel libenki
