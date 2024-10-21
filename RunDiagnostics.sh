# ------------ STEP ONE: RUN NEOFETCH, WHICH CREATES CUTE ASCII ART ------------
(type -p neofetch >/dev/null || (sudo add-apt-repository ppa:dawidd0811/neofetch && sudo apt update && sudo apt install neofetch -y))
neofetch
# ------------ STEP TWO: PERFORM SYSTEM RESOURCE DIAGNOSTICS --------------
echo -e "\033[34;47m" 
echo -e "\n\n\n----------------- SYSTEM RESOURCES -----------------"
echo "These programs are using the most CPU resources in your system:"
ps | sort -k 3 -r | head -n 5
echo -e "\nHere is the information about RAM usage on your device:"
free
echo -e "\nThe storage used by your device is as follows:"
df -h
echo -e "\n\n\n\033[0m"

echo -e "\033[30;42m"
echo -e "\n\n\n----------------- NETWORK CONNECTIVITY -----------------"
if ping -c 1 1.1.1.1 &> /dev/null; then
  echo "You are connected to the internet!"
else
  echo "You are not connected to the internet :("
fi
ifconfig | grep -oE "inet ([0-9]{1,3}\.){3}[0-9]{1,3}"
echo "Most network consuming connections: "
sar -n DEV 1 5 | grep -E "kB/s" | awk '{ print "Up: " $5 / 1024 " MB/s, Down: " $6 / 1024 " MB/s" }'
echo -e "\n\n\n\033[0m"

echo -e "\n\n\n----------------- SYSTEM LOGS -----------------"
cat /var/log/auth.log | head -n 5
