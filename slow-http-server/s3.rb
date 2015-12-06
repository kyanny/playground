require 'socket'
TCPServer.open('0.0.0.0', 8080) do |serv|
  puts "Listen http://0.0.0.0:8080"
  sock = serv.accept
  sock.write "HTTP/1.0 200 OK\r\n\r\nHello world"
  sock.close
  puts "Exit"
end
