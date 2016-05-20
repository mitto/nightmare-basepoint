#!/bin/bash

export DISPLAY=:9.0
bash xvfb.sh start
POINT=$(node /home/node/app/main.js)

if [ $? -gt 0 ]; then
  bash xvfb.sh stop
  exit 1
fi

sudo cp *.png build/

echo "endpoint: $BASEPOINT_SLACK_API_ENDPOINT"
echo "notify to: $BASEPOINT_SLACK_NOTIFY_TO"

message="加算後のポイントは $POINT pt だぞっ！"
echo $message

payload="payload={\"channel\": \"${BASEPOINT_SLACK_NOTIFY_TO}\", \"username\": \"basepoint\", \"text\": \"${message}\", \"icon_emoji\": \":basepoint:\"}"
echo "payload: $payload"

curl -s -m 5 --data-urlencode "${payload}" $BASEPOINT_SLACK_API_ENDPOINT

bash xvfb.sh stop
