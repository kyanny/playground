#!/usr/bin/env ruby
# Usage: ./put.rb
require 'dragonfly'
uid = Dragonfly.app.store(File.open('hello.txt'))
puts uid
