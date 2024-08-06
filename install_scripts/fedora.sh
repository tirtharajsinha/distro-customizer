source includes/color.sh

echo -e "${BBlue}"
cat <<"EOF"
  ______       _                    _____      _               
 |  ____|     | |                  / ____|    | |              
 | |__ ___  __| | ___  _ __ __ _  | (___   ___| |_ _   _ _ __  
 |  __/ _ \/ _` |/ _ \| '__/ _` |  \___ \ / _ \ __| | | | '_ \ 
 | | |  __/ (_| | (_) | | | (_| |  ____) |  __/ |_| |_| | |_) |
 |_|  \___|\__,_|\___/|_|  \__,_| |_____/ \___|\__|\__,_| .__/ 
                                                        | |    
                                                        |_|    
EOF
echo -e "${NONE}\n\n"


echo "::${BPurple}Setting RTC time to use local time${NONE}"
# sudo timedatectl set-local-rtc 1 --adjust-system-clock

echo "::${BPurple}Adding aditional DNF config${NONE}"
sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak
sudo tee -a /etc/dnf/dnf.conf > /dev/null <<EOT
# added by auto installation scripts
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
EOT

echo "::${BPurple}update distro${NONE}"
# sudo dnf update


echo "::${BPurple}setting up RPM fusion repo${NONE}"
# sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

echo "::${BPurple}Updating rpmfusion core${NONE}"
# sudo dnf groupupdate core

echo "::${BPurple}Setting up flatpak${NONE}"
# sudo dnf install flatpak
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "::${BPurple}Optimizing Multimedia codec${NONE}"
# sudo dnf install ffmpeg libavcodec-freeworld --best --allowerasing
# sudo dnf groupupdate multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# sudo dnf groupupdate sound-and-video




echo "::${BPurple}Installing recommended Applications${NONE}"
# installing packages from dnf
sudo dnf update
sudo dnf install git gh gcc neofetch micro xclip htop
sudo dnf install kitty VirtualBox remmina vlc timeshift ufw zsh ranger distrobox eza fzf podman

# web app manager install
sudo dnf copr enable kylegospo/webapp-manager
sudo dnf install webapp-manager


#Onedriver
sudo dnf copr enable jstaf/onedriver
sudo dnf install onedriver

# Flatpak Installation
sudo flatpak install cc.arduino.IDE2 md.obsidian.Obsidian org.telegram.desktop org.x.Warpinator org.onlyoffice.desktopeditors

# Third Party Native app installation

# Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# Visual studio code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code


# Dbeaver
wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
sudo dnf install dbeaver-ce-latest-stable.x86_64.rpm

