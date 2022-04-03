#!bin/bash
# Feed an IP, Url, or hash and browser window pops-up with tabs ready for analysis 
#
# will update with xdg-open, was testing
#
url_reg="[-A-Za-z0-9\+&@#/%?=~_|!:,.;]\.[-A-Za-z0-9\+&@#/%=~_|]"


while getopts ":iuh:" option; do
   case $option in
       i)### Searches IP address
		if [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
			firefox --new-window https://www.malwares.com/report/ip?ip=$2;
      sleep .5;
			firefox --new-tab https://pulsedive.com/ioc/$2;
			firefox --new-tab https://www.abuseipdb.com/check/$2;
			firefox --new-tab https://exchange.xforce.ibmcloud.com/ip/$2;
			firefox --new-tab https://www.virustotal.com/gui/ip-address/$2;
		else 
			echo "Please check IP Address format";
		fi
		;;
	   u)### Searches URLs 
		if [[ $2 =~ $url_reg ]]; then
			firefox --new-window https://www.malwares.com/report/host?host=$2;
			sleep .5;
			firefox --new-tab https://opentip.kaspersky.com/$2;
			sleep .25;
			firefox --new-tab https://urlscan.io/search/#$2;
      sleep .25;
			firefox --new-tab https://pulsedive.com/ioc/$2;
      sleep .25;
			firefox --new-tab https://www.virustotal.com/gui/domain/$2;
      sleep .25;
			firefox --new-tab https://exchange.xforce.ibmcloud.com/url/$2;
		else 
			echo "Please check URL format";
		fi
		;;
	   h)### Searches Hashes
			firefox --new-window https://otx.alienvault.com/indicator/file/$2;
			sleep .5;
			firefox --new-tab https://www.virustotal.com/gui/file/$2;
			sleep .25;
			firefox --new-tab https://www.malwares.com/report/file?hash=$2;
			firefox --new-tab https://opentip.kaspersky.com/$2;
    ;;
   esac
done
