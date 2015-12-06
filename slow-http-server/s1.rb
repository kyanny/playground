require 'socket'
serv = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
# serv.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEPORT, 1)
serv.bind(Socket.sockaddr_in(8080, "0.0.0.0"))
serv.listen(5)
puts "Listen http://0.0.0.0:8080"
sock, _ = serv.accept
sock.write "HTTP/1.0 200 OK\r\n\r\nHello world"
sock.close
puts "Exit"
