#!/usr/bin/env ruby
require 'socket'
require 'optparse'

opt = OptionParser.new
opt.on('--new-wait=VAL')    { |v| @new_wait    = v.to_f }
opt.on('--bind-wait=VAL')   { |v| @bind_wait   = v.to_f }
opt.on('--listen-wait=VAL') { |v| @listen_wait = v.to_f }
opt.on('--accept-wait=VAL') { |v| @accept_wait = v.to_f }
opt.on('--write-wait=VAL')  { |v| @write_wait  = v.to_f }
opt.on('--close-wait=VAL')  { |v| @close_wait  = v.to_f }
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

sleep @new_wait if @new_wait
serv = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
serv.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEPORT, 1)

sleep @bind_wait if @bind_wait
serv.bind(Socket.sockaddr_in(8080, "0.0.0.0"))

sleep @listen_wait if @listen_wait
serv.listen(5)

puts "Listen http://0.0.0.0:8080"

sleep @accept_wait if @accept_wait
sock, _ = serv.accept
if @write_wait
  sock.write body.slice!(0, 1)
  sleep @write_wait
  sock.write body
else
  sock.write body
end

sleep @close_wait if @close_wait
sock.close
puts "Exit"
