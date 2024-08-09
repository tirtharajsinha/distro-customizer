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

PS3="Select profile to continue: "
i=0
items=()
for entry in "profiles"/*
do
  if [ -f "$entry" ];then
    profile=$(basename -a -s .sh ${entry})
    filename=$(basename ${entry})
    items[$i]=${filename}
    let i+=1
    echo -e "${i}) ${profile}"
  fi
done


if [ ${#items[@]} -eq 0 ]
then
    echo -e "No profiles found."
    echo -e "- Create a new profile"
    echo -e "- If created, move profile file to ${YELLOW}/profiles${NONE}"
    exit 1
else
    echo -e "$((${#items[@]}+1))) Exit"
    echo -e "${#items[@]} profiles found."
fi

while true ;
do
PLATFORM=-1
read -p "$PS3" PLATFORM
if [ $PLATFORM -eq $((${#items[@]}+1)) ]
then
    echo -e "${PURPLE}Aborting Distro-Customizer execution${NONE}"
    break
elif [ $PLATFORM -gt $((${#items[@]}+1)) ] || [ $PLATFORM -lt 1 ]
then
    echo -e "${RED}Invalid Choice!! Select again${NONE}"
else
    echo -e "${CYAN}Initializing ${items[$((${PLATFORM}-1))]} setup... ${NONE}"
    source profiles/${items[$((${PLATFORM}-1))]}
    break
fi 
done

