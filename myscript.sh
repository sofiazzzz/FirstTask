#!/bin/bash


SERVER_URL="http://nginx:80"
MAILGUN_API_KEY='api:c4d4780e37ecf2e854fbdbf0ed2f05b2-6b161b0a-f5116e94'
MAILGUN_URL=https://api.mailgun.net/v3/sandboxae5a0f05c239488e8856f6c5275d1fa4.mailgun.org/messages \


function check_status {
  status=$(curl -s -o /dev/null -w '%{http_code}' $SERVER_URL)
  echo "$status"

  if [[ $status != 2* && $status != 3* ]]; then
    message="Server returned status $status at $(date '+%Y-%m-%d %H:%M:%S')"
    curl -s --user "$MAILGUN_API_KEY" "$MAILGUN_URL" \
      -F from='Mailgun Sandbox <postmaster@sandboxae5a0f05c239488e8856f6c5275d1fa4.mailgun.org>' \
      -F to= sofiia.zalivska@lnu.edu.ua \
      -F subject='Server Error' \
      -F text="Server returned status $status at $(date '+%Y-%m-%d %H:%M:%S')"
  fi
}


while true; do
  check_status
  sleep 30
done