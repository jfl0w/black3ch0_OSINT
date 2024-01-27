import argparse
import requests

def scrape_headers(url):
    try:
        # Make an HTTP GET request to the specified URL
        response = requests.get(url)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Print the headers
            print("HTTP Headers for", url)
            print("----------------------")
            for header, value in response.headers.items():
                print(f"{header}: {value}")
        else:
            print(f"Failed to retrieve headers. Status code: {response.status_code}")

    except requests.RequestException as e:
        print(f"Error during HTTP request: {e}")

def main():
    parser = argparse.ArgumentParser(description="Scrape HTTP headers from a URL or an IP/port combination.")
    parser.add_argument("target", help="URL or IP/port combination to scrape headers from")
    
    args = parser.parse_args()
    scrape_headers(args.target)

if __name__ == "__main__":
    main()
