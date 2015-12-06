#!/bin/bash

echo "------------------------------------------------"
echo "s1.rb"
ruby s1.rb &
sleep 1
ruby http_get.rb

echo ""
echo "------------------------------------------------"
echo "s2.rb"
ruby s2.rb &
sleep 1
ruby http_get.rb

echo ""
echo "------------------------------------------------"
echo "s3.rb"
ruby s3.rb &
sleep 1
ruby http_get.rb

echo ""
echo "------------------------------------------------"
echo "s4.rb"
ruby s4.rb &
sleep 1
ruby http_get.rb
