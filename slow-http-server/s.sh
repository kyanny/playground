#!/bin/bash

echo "------------------------------------------------"
echo "s1.rb"
ruby s1.rb &
sleep 1
ruby http_get.rb

echo ""
echo "------------------------------------------------"
echo "s2.rb"
ruby s2.rb &
sleep 1
ruby http_get.rb

echo ""
echo "------------------------------------------------"
echo "s3.rb"
ruby s3.rb &
sleep 1
ruby http_get.rb

echo ""
echo "------------------------------------------------"
echo "s4.rb"
ruby s4.rb &
sleep 1
ruby http_get.rb


# $ ./s.sh
# ------------------------------------------------
# s1.rb
# Listen http://0.0.0.0:8080
# Exit
# /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:153:in `read_nonblock': Connection reset by peer (Errno::ECONNRESET)
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:153:in `rbuf_fill'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:134:in `readuntil'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:144:in `readline'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:39:in `read_status_line'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:28:in `read_new'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1414:in `block in transport_request'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `catch'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `transport_request'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1384:in `request'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1133:in `get'
#         from http_get.rb:5:in `block in <main>'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:853:in `start'
#         from http_get.rb:5:in `<main>'

# ------------------------------------------------
# s2.rb
# Listen http://0.0.0.0:8080
# Exit
# HTTP/1.0 200 OK
# Content-Length: 11

# Hello world

# ------------------------------------------------
# s3.rb
# Listen http://0.0.0.0:8080
# Exit
# /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1453:in `begin_transport'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1410:in `transport_request'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1384:in `request'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1133:in `get'
#         from http_get.rb:5:in `block in <main>'
#         from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:853:in `start'
#         from http_get.rb:5:in `<main>'

# ------------------------------------------------
# s4.rb
# Listen http://0.0.0.0:8080
# Exit
# HTTP/1.0 200 OK
# Content-Length: 11

# Hello world
