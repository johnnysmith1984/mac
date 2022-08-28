#!/bin/bash
sudo clear && sleep .6s && sudo airmon-ng | cut -f 2-6 | cut -b -60 && sleep .6s
echo -n "Specify Interface: " && read answer && clear && sleep .6s
echo "" && echo "~${answer}~" && echo "" && sleep .6s
sudo macchanger -s $answer | cut -b -78 && sleep .6s && echo ""
echo "1) Return to Original MAC" && echo "2) Change MAC to a Different Vendor"
echo "3) Change to a Random MAC" && echo "4) Keep Vendor and Change MAC"
echo "5) Pretend to be a Burned-in-Address" && echo "6) Change to Specific MAC"
echo "7) List Known MAC Vendors" && echo ""
echo -n "Select Option: " && read n && case $n in
0) sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -m 00:24:f3:69:b4:aa $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
1) sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -p $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
2) sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -a $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
3) sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -r $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
4) sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -e $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
5) sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -r -b $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
6) echo "" && echo "            XX:XX:XX:XX:XX:XX"
   echo -n "Specify MAC:" && read answer2
   sudo ip link set dev $answer down && sleep .6s && echo ""
   sudo macchanger -m $answer2 $answer | sed 's/Current MAC: /Previous MAC:/g' | sed "2 d" | cut -b -78;;
7) sleep .6s && echo "" && echo "(Leave Blank to List All)"
   echo -n "   Search by Keyword: " && read answer3 && sleep .6s && echo ""
   sudo macchanger --list=${answer3} | cut -b 6- | sed 's/^[[:space:]]*//g' | cut -b -78 | sed "s/ess MACs://g";;
*) sleep .6s && echo "" && echo "Invalid Option";;
esac
echo "" && sleep .6s && sudo ip link set dev $answer up && sleep .6s
#(mac)#    #uses airmon-ng,macchanger#    #AK#
