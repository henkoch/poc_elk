#!/bin/bash

# originated from ChatGPT

LOG_FILE="logs/http_access.log"
HTTP_METHODS=("GET" "POST" "PUT" "DELETE")
HTTP_CODES=("200" "404" "500" "302")
URL_PATHS=("/home" "/about" "/contact" "/product" "/login")
IP_ADDRESSES=("192.168.1.1" "10.0.0.1" "172.16.0.1")

while true; do
  TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S%z")
  METHOD=${HTTP_METHODS[$((RANDOM % ${#HTTP_METHODS[@]}))]}
  URL_PATH=${URL_PATHS[$((RANDOM % ${#URL_PATHS[@]}))]}
  HTTP_CODE=${HTTP_CODES[$((RANDOM % ${#HTTP_CODES[@]}))]}
  IP=${IP_ADDRESSES[$((RANDOM % ${#IP_ADDRESSES[@]}))]}
  
  LOG_ENTRY="${IP} - - [${TIMESTAMP}] \"${METHOD} ${URL_PATH}\" ${HTTP_CODE} -"
  
  echo $LOG_ENTRY >> $LOG_FILE
  
  sleep 1  # Adjust sleep duration as needed
done
