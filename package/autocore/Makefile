#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=autocore
PKG_VERSION:=1
PKG_RELEASE:=36

include $(INCLUDE_DIR)/package.mk

define Package/autocore
  TITLE:=Arm auto core loadbalance script.
  MAINTAINER:=CN_SZTL
  VARIANT:=arm
endef

define Package/autocore/description
  A luci autoconfig hotplug script.
endef

define Build/Compile
endef

define Package/autocore/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/index.htm $(1)/etc/index.htm
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/090-cover-index_htm $(1)/etc/uci-defaults/090-cover-index_htm
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/sbin/cpuinfo $(1)/sbin/cpuinfo
endef

$(eval $(call BuildPackage,autocore))
