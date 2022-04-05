#!/bin/bash
# Using curl to measure HTTP response times against invalid and valid requests. Testing for HTTP Proxy
#
#"First Byte: "%{time_pretransfer}\\n
#"DNS Lookup:  "%{time_namelookup}\\n

blank_line= echo " "

valid_request= curl -o /dev/null -s -w "VALID RESPONSE:   "%{http_code}\\n"---------------------"\\n"First Byte:  "%{time_pretransfer}\\n"TCP Connect: "%{time_connect}\\n"Total Time:  "%{time_total}\\n $1

blank_line= echo " "

invalid_request= curl -o /dev/null -s -H "Host: " -w "INVALID RESPONSE: "%{http_code}\\n"---------------------"\\n"First Byte:  "%{time_pretransfer}\\n"TCP Connect: "%{time_connect}\\n"Total Time:  "%{time_total}\\n $1
