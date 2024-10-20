# ------------ STEP ONE: RUN NEOFETCH, WHICH CREATES CUTE ASCII ART ------------
neofetch
# ------------ STEP TWO: PERFORM SYSTEM RESOURCE DIAGNOSTICS --------------
echo -e "\033[34;47m ----------------- SYSTEM RESOURCES -----------------"
echo "These programs are using the most CPU resources in your system:"
ps | sort -k 3 -r | head -n 5
echo -e "\nHere is the information about RAM usage on your device:"
free
echo -e "\nThe storage used by your device is as follows:"
df -h
echo -e "\033[0m"
