#!/bin/bash

for serveropt in --new-wait --bind-wait --listen-wait --accept-wait --write-wait --close-wait; do
  for http in "http_get_open_timeout.rb" "http_get_read_timeout.rb"; do
    echo ''
    echo '------------------------------------------------'
    echo "# ${serveropt} 3 | ${http} 1"
    echo "$ ruby server.rb $serveropt 3"
    ruby server.rb $serveropt 3 &
    sleep 1
    for n in `seq 3`; do
      echo "$ ruby $http 1"
      ruby $http 1
      if [ $? == 0 ]; then
        break
      fi
      sleep 1
    done
  done
done
