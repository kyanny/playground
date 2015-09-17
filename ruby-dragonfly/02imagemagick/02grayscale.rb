#!/usr/bin/env ruby
# Usage: ./thumb.rb
require 'dragonfly'
Dragonfly.app.configure do
  plugin :imagemagick
end
Dragonfly.app.fetch_file('lena_std.tif').convert('-type Grayscale').to_file('out.jpg')
