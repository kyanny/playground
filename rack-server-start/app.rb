require 'rack'

# rackup
#   https://github.com/rack/rack/blob/1.6.4/bin/rackup
#
# Rack::Server#default_options
#   https://github.com/rack/rack/blob/1.6.4/lib/rack/server.rb#L193-L205

Rack::Server.start(
  app: ->(env) { [200, {}, ["OK\n"]] },
  Port: 9292,
  environment: 'development'
)
