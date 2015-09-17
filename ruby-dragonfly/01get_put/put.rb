#!/usr/bin/env ruby
require 'dragonfly'
uid = Dragonfly.app.store(File.open('hello.txt'))
puts uid
