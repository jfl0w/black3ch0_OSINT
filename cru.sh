#!/bin/bash
# Bash script to test for HTTP proxy against HTTP response times for invalid and valid requests.
# Curl time options: 
# time_appconnect
# The time, in seconds, it took from the start until
# the SSL/SSH/etc connect/handshake to the remote
# host was completed. 
#
# time_connect
# The time, in seconds, it took from the start until
# the TCP connect to the remote host (or proxy) was
# completed.
#
# time_namelookup
# The time, in seconds, it took from the start until
# the name resolving was completed.
#
# time_pretransfer
# The time, in seconds, it took from the start until
# the file transfer was just about to begin. This
# includes all pre-transfer commands and negotiations
# that are specific to the particular protocol(s)
# involved.
#
# time_redirect
# The time, in seconds, it took for all redirection
# steps including name lookup, connect, pretransfer
# and transfer before the final transaction was
# started. time_redirect shows the complete execution
# time for multiple redirections. 
#
# time_starttransfer
# The time, in seconds, it took from the start until
# the first byte was just about to be transferred.
# This includes time_pretransfer and also the time
# the server needed to calculate the result.
#
# time_total
# The total time, in seconds, that the full operation
# lasted.
#
# url  - The URL that was fetched. 
http_code= echo " "
invalid_request= curl -o /dev/null -s -H "Host: " -w "INVALID RESPONSE: "%{http_code}\\n"---------------------"\\n"Total Time:  "%{time_connect}\\n $1 
http_code= echo " "
valid_request= curl -o /dev/null -s -w "VALID RESPONSE:   "%{http_code}\\n"---------------------"\\n"Total Time:  "%{time_connect}\\n $1
http_code= echo " "
valid_request= curl -o /dev/null -s -w "VALID HTTP:    "\\n"-------------------"\\n"TCP Complete: "%{time_connect}\\n"TLS Complete:  "%{time_appconnect}\\n"DNS Resolved:  "%{time_namelookup}\\n"URL:  "%{url}\\n $1
