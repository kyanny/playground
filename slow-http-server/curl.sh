#!/bin/bash

echo '# No wait & timeout'
echo "$ ruby server.rb"
ruby server.rb &
sleep 1
echo "$ curl -isS localhost:8080"
curl -isS localhost:8080
sleep 2

for serveropt in --new-wait --bind-wait --listen-wait --accept-wait --write-wait --close-wait; do
  for curlopt in --connect-timeout --max-time; do
    echo ''
    echo '------------------------------------------------'
    echo "# ${serveropt} 2 | ${curlopt} 1"
    echo "$ ruby server.rb $serveropt 2"
    ruby server.rb $serveropt 2 &
    sleep 1
    for n in `seq 3`; do
      echo "$ curl -isS localhost:8080 $curlopt 1"
      curl -isS localhost:8080 $curlopt 1
      sleep 1
    done
  done
done
