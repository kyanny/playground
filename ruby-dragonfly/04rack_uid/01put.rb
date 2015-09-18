#!/usr/bin/env ruby
require 'dragonfly'
Dragonfly.app.configure do
  verify_urls false
end
uid = Dragonfly.app.store(File.open('index.html'))
puts "http://localhost:9292/" + uid
