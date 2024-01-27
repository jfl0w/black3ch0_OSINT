#!bin/bash
#
url_reg="[-A-Za-z0-9\+&@#/%?=~_|!:,.;]\.[-A-Za-z0-9\+&@#/%=~_|]"


while getopts ":iuh:" option; do
   case $option in
       i)### Searches IP address
		if [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
			firefox --new-window https://www.virustotal.com/gui/ip-address/$2;sleep .5;
			firefox --new-tab https://www.shodan.io/host/$2;sleep .25;
			firefox --new-tab https://viz.greynoise.io/ip/$2;sleep .25;
			firefox --new-tab https://exchange.xforce.ibmcloud.com/ip/$2;
		else 
			echo "Please check IP Address format";
		fi
		;;
	   u)### Searches URLs 
		if [[ $2 =~ $url_reg ]]; then
			firefox --new-window https://urlscan.io/search/#$2;sleep .5;
			firefox --new-tab https://pulsedive.com/ioc/$2;sleep .25;
			firefox --new-tab https://www.virustotal.com/gui/domain/$2;sleep .25;
			firefox --new-tab https://exchange.xforce.ibmcloud.com/url/$2;
		else 
			echo "Please check URL format";
		fi
		;;
	   h)### Searches Hashes
			firefox --new-window https://www.malwares.com/report/file?hash=$2;
			sleep .25;
			firefox --new-tab https://www.virustotal.com/gui/file/$2;
			;;		
		esac
exit
done
