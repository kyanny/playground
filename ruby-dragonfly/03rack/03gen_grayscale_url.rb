#!/usr/bin/env ruby
require 'dragonfly'
Dragonfly.app.configure do
  verify_urls false
  plugin :imagemagick
end
uid = Dragonfly.app.store(File.open('lena_std.png'))
url_path = Dragonfly.app.fetch(uid).convert('-type Grayscale').url
puts "http://localhost:9292" + url_path
