#!/usr/bin/env ruby
# Usage: ./thumb.rb
require 'dragonfly'
Dragonfly.app.configure do
  plugin :imagemagick
end
Dragonfly.app.fetch_file('lena_std.tif').encode('jpg', '-quality 10').convert('-type Grayscale').thumb('128x128').to_file('out.jpg')
