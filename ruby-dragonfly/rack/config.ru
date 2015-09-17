require 'dragonfly'
Dragonfly.app.configure do
  verify_urls false
  plugin :imagemagick
end
run Dragonfly.app
