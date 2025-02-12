echo -e "::${BGreen}Getting dotfiles${NONE}"
git clone https://github.com/tirtharajsinha/customization_linux.git

echo -e "::${BGreen}Setting up ohmyzsh${NONE}"
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
cp customization_linux/zshconf/.zshrc ~/.zshrc

echo -e "::${BGreen}installing nerd fonts${NONE}"
mkdir ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
unzip RobotoMono.zip -d ~/.fonts
rm -r RobotoMono*

echo -e "::${BGreen}Creatting Developer foloder${NONE}"
mkdir ~/Developer

echo -e "::${BGreen}setting up oh-my-posh terminal prompt${NONE}"
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin
cp -r customization_linux/oh-my-posh-themes ~/Developer/oh_my_posh_themes

echo -e "::${BGreen}Adding Kitty Config${NONE}"
cp -r customization_linux/kitty ~/.config/

echo -e "::${BGreen}Adding neofetch Config${NONE}"
cp -r customization_linux/neofetch ~/.config/