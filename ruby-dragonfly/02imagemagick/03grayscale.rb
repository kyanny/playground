#!/usr/bin/env ruby
require 'dragonfly'
Dragonfly.app.configure do
  plugin :imagemagick
end
Dragonfly.app.fetch_file('lena_std.tif').convert('-type Grayscale').encode('jpg').to_file('out.jpg')
