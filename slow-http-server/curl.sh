#!/bin/bash

echo '# No timeout'
echo "$ ruby server.rb"
ruby server.rb &
sleep 1
echo "$ curl -i localhost:8080"
curl -i localhost:8080
sleep 2

for serveropt in --new-timeout --bind-timeout --listen-timeout --accept-timeout --write-timeout --close-timeout; do
  for curlopt in --connect-timeout --max-time; do
    echo ''
    echo '------------------------------------------------'
    echo "# ${serveropt} 2 | ${curlopt} 1"
    echo "$ ruby server.rb $serveropt 2"
    ruby server.rb $serveropt 2 &
    sleep 1
    for n in `seq 3`; do
      echo "$ curl -i localhost:8080 $curlopt 1"
      curl -i localhost:8080 $curlopt 1
      sleep 1
    done
  done
done
