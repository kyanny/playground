#!/usr/bin/env ruby
# Usage: ./put.rb hello.txt
require 'dragonfly'
uid = Dragonfly.app.store(File.open(ARGV[0]))
puts uid
