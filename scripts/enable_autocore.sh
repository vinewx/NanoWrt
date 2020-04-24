
[ -f package/lean/autocore/Makefile ] && sed -i 's/@TARGET_x86 //g' package/lean/autocore/Makefile

[ -f package/lean/autocore/files/autocore ] && sed -i 's/echo $g /#echo $g/g;s/ethtool -K $c tx-scatter/#ethtool -K $c tx-scatter/g' package/lean/autocore/files/autocore

[ -f package/lean/autocore/files/sbin/cpuinfo ] && sed -ri 's/(MHz=).+/mark/g' package/lean/autocore/files/sbin/cpuinfo
[ -f package/lean/autocore/files/sbin/cpuinfo ] && sed -i '/mark/i\\tMHz=`echo "$(cat /sys/devices/system/cpu/cpu[04]/cpufreq/cpuinfo_cur_freq)/1000" | bc`' package/lean/autocore/files/sbin/cpuinfo
[ -f package/lean/autocore/files/sbin/cpuinfo ] && sed -i '/a=""/i\\t\ta=`echo "scale=2; $(cat /sys/class/thermal/thermal_zone0/temp)/1000" | bc`℃' package/lean/autocore/files/sbin/cpuinfo
[ -f package/lean/autocore/files/sbin/cpuinfo ] && sed -i '/a=""/Id;/mark/Id' package/lean/autocore/files/sbin/cpuinfo
