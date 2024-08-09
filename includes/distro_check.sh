distroname=$(lsb_release -ds)

if  echo "$distroname" | grep -iqF "$TARGET_DISTRONAME";
then
  echo -e "${BGreen}Target Compatibility Check - Passed ✔${NONE}"
else
  echo -e "${BRed}Target Compatibility Check - Failed X${NONE}"
  echo -e "Target Distro - $TARGET_DISTRONAME"
  echo -e "This script not compatible for $distroname"
  exit 1
fi