#!/usr/bin/python
# 
# Simple script to pull HTTP headers from web page
# Use argument options "--HTTP" "--HTTPS" to pass URLs to the script e.g. "hedrz.py --HTTPS example.com"
# Use "--ip" to pass IP/Port Combo to the script e.g. "hedrz.py --ip 192.168.1.1:80"
#

import argparse
import requests

def scrape_headers(target):
    try:
        # Make an HTTP GET request to the specified URL
        response = requests.get(target)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Print the headers
            print(f"HTTP Headers for {target}")
            print("----------------------")
            for header, value in response.headers.items():
                print(f"{header}: {value}")
        else:
            print(f"Failed to retrieve headers. Status code: {response.status_code}")

    except requests.RequestException as e:
        print(f"Error during HTTP request: {e}")

def main():
    parser = argparse.ArgumentParser(description="Scrape HTTP headers from a URL, IP/port combination, or domain.")
    parser.add_argument("target", help="URL, IP/port combination, or domain to scrape headers from")

    group = parser.add_mutually_exclusive_group()
    group.add_argument("--http", action="store_true", help="Use HTTP scheme (http://<target>)")
    group.add_argument("--https", action="store_true", help="Use HTTPS scheme (https://<target>)")
    group.add_argument("--ip", action="store_true", help="Assume the target is an IP address (http://<target>)")

    args = parser.parse_args()

    # Use http, https, or IP/Port Combo based on command-line options
    if args.https:
        target = "https://" + args.target
    elif args.http:
        target = "http://" + args.target
    elif args.ip:
        target = "http://" + args.target
    else:
        target = args.target

    scrape_headers(target)

if __name__ == "__main__":
    main()
