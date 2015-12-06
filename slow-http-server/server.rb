#!/usr/bin/env ruby
require 'socket'
require 'optparse'

opt = OptionParser.new
opt.on('--new-timeout=VAL')    { |v| @new_timeout    = v.to_f }
opt.on('--bind-timeout=VAL')   { |v| @bind_timeout   = v.to_f }
opt.on('--listen-timeout=VAL') { |v| @listen_timeout = v.to_f }
opt.on('--accept-timeout=VAL') { |v| @accept_timeout = v.to_f }
opt.on('--write-timeout=VAL')  { |v| @write_timeout  = v.to_f }
opt.on('--close-timeout=VAL')  { |v| @close_timeout  = v.to_f }
opt.parse!

body = if ARGV.first
         File.read(ARGV.first)
       else
         "HTTP/1.0 200 OK\r
Content-Length: 12\r
\r
Hello world
"
       end

sleep @new_timeout if @new_timeout
serv = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
serv.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEPORT, 1)

sleep @bind_timeout if @bind_timeout
serv.bind(Socket.sockaddr_in(8080, "0.0.0.0"))

sleep @listen_timeout if @listen_timeout
serv.listen(5)

puts "Listen http://0.0.0.0:8080"

sleep @accept_timeout if @accept_timeout
sock, _ = serv.accept
if @write_timeout
  sock.write body.slice!(0, 1)
  sleep @write_timeout
  sock.write body
else
  sock.write body
end

sleep @close_timeout if @close_timeout
sock.close
puts "Exit"
