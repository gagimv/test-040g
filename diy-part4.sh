#!/bin/bash

# 应用 DTS 补丁
echo "应用 DTS 优化补丁..."
if [ -f "$GITHUB_WORKSPACE/scripts/patch-master/patch.sh" ]; then
    cd "$GITHUB_WORKSPACE/scripts/patch-master"
    bash patch.sh
    cd "$GITHUB_WORKSPACE/openwrt"
    echo "DTS 补丁应用完成"
else
    echo "警告: 未找到补丁脚本"
fi

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# turboacc
curl -sSL https://raw.githubusercontent.com/mufeng05/turboacc/main/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

# temp
git clone https://github.com/gSpotx2f/luci-app-temp-status package/luci-app-temp-status
git clone https://github.com/gSpotx2f/luci-app-cpu-perf package/luci-app-cpu-perf

# OpenClash
git clone --depth 1 https://github.com/vernesong/OpenClash.git OpenClash

# luci-app-airoha-npu
if [ ! -d "package/luci-app-airoha-npu" ]; then
    git clone https://github.com/rchen14b/luci-app-airoha-npu package/luci-app-airoha-npu
fi




