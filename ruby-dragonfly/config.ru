require 'dragonfly'

Dragonfly.app.configure do
  verify_urls false
end

run Dragonfly.app
