#!/usr/bin/env ruby
require 'net/http'

http = Net::HTTP.new('localhost', 8080)
if ARGV[0]
  http.open_timeout = ARGV[0].to_f
end
res = http.start { |h| h.get('/') }
puts "HTTP/#{res.http_version} #{res.code} #{res.message}"
res.each_capitalized do |k,v|
  puts "#{k}: #{v}"
end
puts ""
puts res.body
