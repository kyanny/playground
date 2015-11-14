#!/usr/bin/env ruby
require 'socket'
require 'rack'
require 'net/http'
require 'uri'

pid = fork do
  app = ->(env) { [200, {'Content-Type' => 'text/plain'}, ['ok']] }
  Rack::Server.start(app: app,  Port: 9292)
end

# wait until rack server launch
loop do
  begin
    TCPSocket.open('localhost', 9292)
    break
  rescue
  end
end

p Net::HTTP.get_response URI('http://localhost:9292/')

Process.kill "INT", pid

# wait until rack server shutdown
loop do
  begin
    TCPSocket.open('localhost', 9292)
  rescue
    break
  end
end
