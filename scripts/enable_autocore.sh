
[ -f package/autocore/Makefile ] && sed -i 's/@TARGET_x86 //g' package/autocore/Makefile

[ -f package/autocore/files/autocore ] && sed -i 's/echo $g /#echo $g/g;s/ethtool -K $c tx-scatter/#ethtool -K $c tx-scatter/g' package/autocore/files/autocore

[ -f package/autocore/files/sbin/cpuinfo ] && sed -ri 's/(MHz=).+/mark/g' package/autocore/files/sbin/cpuinfo
[ -f package/autocore/files/sbin/cpuinfo ] && sed -i '/mark/i\\tMHz=`echo "$(cat /sys/devices/system/cpu/cpu[04]/cpufreq/cpuinfo_cur_freq)/1000" | bc`' package/autocore/files/sbin/cpuinfo
[ -f package/autocore/files/sbin/cpuinfo ] && sed -i '/a=""/i\\t\ta=`echo "scale=2; $(cat /sys/class/thermal/thermal_zone0/temp)/1000" | bc`℃' package/autocore/files/sbin/cpuinfo
[ -f package/autocore/files/sbin/cpuinfo ] && sed -i '/a=""/Id;/mark/Id' package/autocore/files/sbin/cpuinfo

[ -f package/autocore/files/index.htm ] && sed -ri '/.+(CPU Info).+/Id;' package/autocore/files/index.htm
[ -f package/autocore/files/index.htm ] && sed -i '/Load Average/i\\t\t<tr><td width="33%"><%:CPU Info%></td><td id="cpuinfo">-</td></tr>' package/autocore/files/index.htm

[ -f feeds/luci/modules/luci-base/po/zh-cn/base.po ] && echo >> feeds/luci/modules/luci-base/po/zh-cn/base.po
[ -f feeds/luci/modules/luci-base/po/zh-cn/base.po ] && echo msgid \"CPU Info\" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
[ -f feeds/luci/modules/luci-base/po/zh-cn/base.po ] && echo msgstr \"CPU 状态\" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
