#!/bin/bash

echo '"HTTP/1.0 200 OK\r\n\r\nHello world" | nc -l 8080'
echo "HTTP/1.0 200 OK\r\n\r\nHello world" | nc -l 8080 &

sleep 1

echo ""
echo 'ruby http_get.rb'
ruby http_get.rb


# $ ./nc.sh
# "HTTP/1.0 200 OK\r\n\r\nHello world" | nc -l 8080

# ruby http_get.rb
# GET / HTTP/1.1
# Accept-Encoding: gzip;q=1.0,deflate;q=0.6,identity;q=0.3
# Accept: */*
# User-Agent: Ruby
# Host: localhost:8080

# HTTP/1.0 200 OK\r\n\r\nHello world


