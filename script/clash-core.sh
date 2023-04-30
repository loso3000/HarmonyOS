
#!/bin/bash
rm -rf /package/lean/r8168/patches/020-5.18-support.patch
mkdir -p files/etc/openclash/core
# sed -i "s/PKG_HASH:=.*/PKG_HASH:=5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72/g"  ./feeds/packages/utils/jq/Makefile
open_clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# offical_clash_main_url=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
wget -qO- $open_clash_main_url | tar xOvz > files/etc/openclash/core/clash
# wget -qO- $offical_clash_main_url | gunzip -c > files/etc/openclash/core/clash
wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game
chmod +x files/etc/openclash/core/clash*

GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# oh-my-zsh
mkdir -p files/root
pushd files/root
git clone https://github.com/robbyrussell/oh-my-zsh ./.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions
cp $GITHUB_WORKSPACE/file/zsh/.zshrc .
popd

# speedtest
# mkdir -p files/bin
# wget -qO- https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-aarch64.tgz | tar xOvz > files/bin/speedtest
# wget -qO- https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz | tar xOvz > files/bin/speedtest
# chmod +x files/bin/speedtest
