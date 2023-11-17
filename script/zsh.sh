

# shell zsh
# sed -i "s/\/bin\/ash/\/usr\/bin\/zsh/g" package/base-files/files/etc/passwd
# oh-my-zsh
mkdir -p files/root
pushd files/root
## Install oh-my-zsh
# Clone oh-my-zsh repository
git clone https://github.com/ohmyzsh/ohmyzsh ./.oh-my-zsh

# Install extra plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions
# Get .zshrc dotfile
# cp $GITHUB_WORKSPACE/scripts/.zshrc .
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/z.zshrc > ./.zshrc
mv -f ../../package/other/patch/z.zshrc ./.zshrc
popd
mv -f ./package/other/patch/z.zshrc ./files/root/.zshrc
mv -f ./package/other/patch/profiles ./files/etc/profiles
ls -a ./files/root
echo "------------------------------------------------------"
ls -a ./files/etc
echo "================== zshrc ==================="
