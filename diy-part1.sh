#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git OpenClash https://github.com/vernesong/OpenClash.git' >>feeds.conf.default
echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic.git' >>feeds.conf.default
echo 'src-git cdnspeedtest https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git' >>feeds.conf.default

# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default



# rm -rf package/luci-app-ikoolproxy
# rm -rf package/luci-app-ikoolproxy2
# git clone --depth 1  https://github.com/ilxp/luci-app-ikoolproxy2.git package/luci-app-ikoolproxy

svn co https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist  package/luci-app-alist

# rm -rf package/feeds/luci/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
# echo '### Argon Theme Config ###'

./scripts/feeds update -a
./scripts/feeds install -a
