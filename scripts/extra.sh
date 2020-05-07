# Enter the "package" directory.
cd package

# lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean
cp -r lean/* ./
rm -rf lean luci-lib-docker luci-app-dockerman luci-app-diskman parted

# openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
sed -i 's/444/808080/g' luci-app-openclash/files/usr/lib/lua/luci/view/openclash/myip.htm
pushd base-files/files
mkdir -p etc/openclash/core
wget -qO- https://github.com/Dreamacro/clash/releases/download/v0.19.0/clash-linux-armv8-v0.19.0.gz | gunzip -c > etc/openclash/core/clash
chmod +x etc/openclash/core/clash
popd

# darkmatter theme
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git
pushd luci-theme-darkmatter
git checkout fd88e48ad0932dd1de47ff1f4274d5202c59f4f0
popd

# Return to "friendlywrt" directory.
cd ../

# dockerman
mkdir -p package/luci-lib-docker
wget https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile -O package/luci-lib-docker/Makefile
mkdir -p package/luci-app-dockerman
wget https://raw.githubusercontent.com/lisaac/luci-app-dockerman/master/Makefile -O package/luci-app-dockerman/Makefile

# diskman
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
