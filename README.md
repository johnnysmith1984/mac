
-README-    ~mac.sh~    Does a Task Well    usage: ./mac.sh

Mac.sh uses airmon-ng to display interface names and macchanger to do the damn.
I created mac.sh (originally macsauce.sh) to make modifying your mac easy and 
straight forward enough that anyone can do it with limited knowledge or tools. 
By utilizing the functionality of macchanger and adding some features of my own,
I have attempted to achieve this. Mac.sh sets the interface down automatically
before modifying the MAC, and sets it back up once the desired changes have been
applied. Designed with ease of use in mind, accomplished as easily as I could.

 

I added a hidden easter egg 0 option just kinda messing around, and it has 
turned out to be pretty useful. Its basically a MAC preset. By default it
changes your MAC to a Nintendo MAC, but you can easily replace that MAC with a
MAC of your choosing. Or better yet, copy the whole zero option in the script, 
paste it on the line directly above what you just copied, change the 0 to a 
number or string of your choosing (except 0-7). Stick a MAC you like in there 
and BOOM!(RIP Madden) Repeat the process to create MAC presets till your hearts
content. Im not sure I described that well, but I have faith in you.

                                ~#AKA#~

P.S. Just a side note, if your OS is set up to change your MAC automatically,
(Many Pentesting and Security distributions like Kali or Parrot do this) 
your gonna wanna change that. You can take my word for it, or do your research,
but suffice it to say, it applies your Actual MAC as a "random" MAC at "random"
or undesired times. Thats not awesome. If your on a debian distro, open
/etc/NetworkManager/NetworkManager.conf in your favorite text editor and make
the appropriate changes. Heres mine from a debian system that works good for me:

Example: sudo nano /etc/NetworkManager/NetworkManager.conf

###################################

[main]
plugins = ifupdown,keyfile

[ifupdown]
managed = false

[device]
wifi.scan-rand-mac-address=no

[keyfile]
unmanaged-devices = interface-name:
 
###################################

The line that says unmanaged-devices is not needed, but comes in handy to
unmanage devices/interfaces on the fly for future reference..

#mac.sh#        #uses macchanger and airmon-ng#
