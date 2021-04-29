
# Complementary Chineseization
[ -f feeds/luci/modules/luci-base/po/zh-cn/base.po ] && echo >> feeds/luci/modules/luci-base/po/zh-cn/base.po
[ -f feeds/luci/modules/luci-base/po/zh-cn/base.po ] && echo msgid \"Architecture\" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
[ -f feeds/luci/modules/luci-base/po/zh-cn/base.po ] && echo msgstr \"架构\" >> feeds/luci/modules/luci-base/po/zh-cn/base.po


# Fix luci-app-aria2 bug
[ -f feeds/luci/applications/luci-app-aria2/luasrc/view/aria2/overview_status.htm ] && sed -i 's/nas/services/g' feeds/luci/applications/luci-app-aria2/luasrc/view/aria2/overview_status.htm
[ -f feeds/luci/applications/luci-app-aria2/luasrc/controller/aria2.lua ] && sed -i 's/nas/services/g' feeds/luci/applications/luci-app-aria2/luasrc/controller/aria2.lua