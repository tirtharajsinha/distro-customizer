#!/bin/bash

version=$(cat includes/.version)
source includes/color.sh


clear
echo -e "${BCyan}"
cat <<"EOF"
  _____  _     _                _____          _                  _              
 |  __ \(_)   | |              / ____|        | |                (_)             
 | |  | |_ ___| |_ _ __ ___   | |    _   _ ___| |_ ___  _ __ ___  _ _______ _ __ 
 | |  | | / __| __| '__/ _ \  | |   | | | / __| __/ _ \| '_ ` _ \| |_  / _ \ '__|
 | |__| | \__ \ |_| | | (_) | | |___| |_| \__ \ || (_) | | | | | | |/ /  __/ |   
 |_____/|_|___/\__|_|  \___/   \_____\__,_|___/\__\___/|_| |_| |_|_/___\___|_|                                                                                 
EOF
echo -e "${NONE}"

echo "Version: $version"
echo -e "${GREEN}by Tirtharaj Sinha${NONE}\n\n"


#!/bin/bash

PS3="Select item please: "

items=("dabian" "fedora" "arch")
PLATFORM=-1

select item in "${items[@]}" Quit
do
    case $REPLY in
        1) echo -e "You are using ${CYAN} $item ${NONE}, we will use ${YELLOW}--> apt <--${NONE} as packate manager"; PLATFORM=$REPLY; break;;
        2) echo -e "You are using ${CYAN} $item ${NONE}, we will use ${YELLOW}--> dnf <--${NONE} as packate manager"; PLATFORM=$REPLY; break;;
        3) echo -e "You are using ${CYAN} $item ${NONE}, we will use ${YELLOW}--> pacman <--${NONE} as packate manager"; PLATFORM=$REPLY; break;;
        $((${#items[@]}+1))) echo -e "${RED}::Aborting Setup${NONE}"; break;;
        *) echo "Ooops - unknown choice $REPLY";;
    esac
done

if [ $PLATFORM -eq 1 ]
then
    echo -e "${PURPLE}Initializing dabian setup${NONE}"

elif [ $PLATFORM -eq 2 ]
then
    echo -e "${PURPLE}Initializing fedora setup ${NONE}"
    source install_scripts/fedora.sh
elif [ $PLATFORM -eq 3 ]
then
    echo -e "${PURPLE}Initializing arch setup ${NONE}"
fi 

if [ $PLATFORM -eq -1 ]
then
   echo "aborting Customization, is apply customization manually run:"
   echo -e "${BRed}sh install_scripts/customization.sh${NONE}"

else
   echo -e "${YELLOW}Initializing shell customization ${NONE}"
   source install_scripts/customization.sh
fi
