#!/usr/bin/env python3
# Pop Up OSIntel Python: Feed an IP, Url, or hash and browser window opens with tabs ready for analysis. Change OSINT source to those you prefer
# To use this script, save it into a file (e.g., PopUpOSINT.py), and then you can run it from the terminal with a command like: python PopUpOSINT.py -i <target>
#
#

import argparse
import re
import webbrowser
import time

def open_browser_tabs(ip_or_url_or_hash):
    url_reg = r"[-A-Za-z0-9\+&@#/%?=~_|!:,.;]\.[-A-Za-z0-9\+&@#/%=~_|]"

    if re.match(r"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$", ip_or_url_or_hash):
        ip_tabs = [
            f"https://www.shodan.io/host/{ip_or_url_or_hash}",
            f"https://pulsedive.com/ioc/{ip_or_url_or_hash}",
            f"https://viz.greynoise.io/ip/{ip_or_url_or_hash}",
            f"https://exchange.xforce.ibmcloud.com/ip/{ip_or_url_or_hash}",
            f"https://www.virustotal.com/gui/ip-address/{ip_or_url_or_hash}"
        ]
        open_tabs(ip_tabs)
    elif re.match(url_reg, ip_or_url_or_hash):
        url_tabs = [
            f"https://opentip.kaspersky.com/{ip_or_url_or_hash}",
            f"https://urlscan.io/search/#{ip_or_url_or_hash}",
            f"https://pulsedive.com/ioc/{ip_or_url_or_hash}",
            f"https://www.virustotal.com/gui/domain/{ip_or_url_or_hash}",
            f"https://exchange.xforce.ibmcloud.com/url/{ip_or_url_or_hash}"
        ]
        open_tabs(url_tabs)
    else:
        hash_tabs = [
            f"https://otx.alienvault.com/indicator/file/{ip_or_url_or_hash}",
            f"https://www.virustotal.com/gui/file/{ip_or_url_or_hash}",
            f"https://www.malwares.com/report/file?hash={ip_or_url_or_hash}",
            f"https://opentip.kaspersky.com/{ip_or_url_or_hash}"
        ]
        open_tabs(hash_tabs)

def open_tabs(urls):
    for url in urls:
        webbrowser.open_new_tab(url)
        time.sleep(0.25)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Open browser tabs for IP, URL, or hash analysis.")
    parser.add_argument("-i", dest="ip_or_url_or_hash", required=True, help="Provide an IP, URL, or hash for analysis.")
    args = parser.parse_args()

    open_browser_tabs(args.ip_or_url_or_hash)
