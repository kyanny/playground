#!/bin/bash

echo '"HTTP/1.0 200 OK\r\n\r\nHello world" | nc -l 8080'
echo "HTTP/1.0 200 OK\r\n\r\nHello world" | nc -l 8080 &

sleep 1

echo ""
echo 'ruby http_get.rb'
ruby http_get.rb
