Slow HTTP server
================

You can specify wait time for several steps of TCP server socket operation.

```
$ ruby server.rb -h
Usage: server [options]
        --new-wait=VAL
        --bind-wait=VAL
        --listen-wait=VAL
        --accept-wait=VAL
        --write-wait=VAL
        --close-wait=VAL
```

You can specify HTTP response data of server.

```
$ curl -i example.com > resp.txt
$ ruby server.rb resp.txt
```

Tests with `curl(1)`'s timeout options.

```
$ ./curl.sh
# No wait & timeout
$ ruby server.rb
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --new-wait 2 | --connect-timeout 1
$ ruby server.rb --new-wait 2
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --connect-timeout 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --new-wait 2 | --max-time 1
$ ruby server.rb --new-wait 2
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --max-time 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --bind-wait 2 | --connect-timeout 1
$ ruby server.rb --bind-wait 2
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --connect-timeout 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --bind-wait 2 | --max-time 1
$ ruby server.rb --bind-wait 2
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --max-time 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --listen-wait 2 | --connect-timeout 1
$ ruby server.rb --listen-wait 2
$ curl -isS localhost:8080 --connect-timeout 1
curl: (28) Connection timed out after 1006 milliseconds
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --connect-timeout 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --listen-wait 2 | --max-time 1
$ ruby server.rb --listen-wait 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Connection timed out after 1005 milliseconds
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --max-time 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --accept-wait 2 | --connect-timeout 1
$ ruby server.rb --accept-wait 2
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --connect-timeout 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --accept-wait 2 | --max-time 1
$ ruby server.rb --accept-wait 2
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --max-time 1
curl: (28) Operation timed out after 1003 milliseconds with 0 bytes received
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --write-wait 2 | --connect-timeout 1
$ ruby server.rb --write-wait 2
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Exit

------------------------------------------------
# --write-wait 2 | --max-time 1
$ ruby server.rb --write-wait 2
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --max-time 1
curl: (28) Operation timed out after 1002 milliseconds with 0 bytes received
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --close-wait 2 | --connect-timeout 1
$ ruby server.rb --close-wait 2
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --close-wait 2 | --max-time 1
$ ruby server.rb --close-wait 2
Listen http://0.0.0.0:8080
$ curl -isS localhost:8080 --max-time 1
Exit
curl: (56) Recv failure: Connection reset by peer
$ curl -isS localhost:8080 --max-time 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
```

Tests with Ruby's `net/http` timeout options.

```
$ ./http.sh

------------------------------------------------
# --new-wait 3 | http_get_open_timeout.rb 1
$ ruby server.rb --new-wait 3
$ ruby http_get_open_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:88:in `block in timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `call'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_open_timeout.rb:8:in `<main>'
$ ruby http_get_open_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:88:in `block in timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `call'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_open_timeout.rb:8:in `<main>'
Listen http://0.0.0.0:8080
$ ruby http_get_open_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --new-wait 3 | http_get_read_timeout.rb 1
$ ruby server.rb --new-wait 3
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
Listen http://0.0.0.0:8080
$ ruby http_get_read_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --bind-wait 3 | http_get_open_timeout.rb 1
$ ruby server.rb --bind-wait 3
$ ruby http_get_open_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:88:in `block in timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `call'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_open_timeout.rb:8:in `<main>'
$ ruby http_get_open_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:88:in `block in timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `call'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_open_timeout.rb:8:in `<main>'
Listen http://0.0.0.0:8080
$ ruby http_get_open_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --bind-wait 3 | http_get_read_timeout.rb 1
$ ruby server.rb --bind-wait 3
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
Listen http://0.0.0.0:8080
$ ruby http_get_read_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --listen-wait 3 | http_get_open_timeout.rb 1
$ ruby server.rb --listen-wait 3
$ ruby http_get_open_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': execution expired (Net::OpenTimeout)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:88:in `block in timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `call'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:98:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_open_timeout.rb:8:in `<main>'
Listen http://0.0.0.0:8080
$ ruby http_get_open_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --listen-wait 3 | http_get_read_timeout.rb 1
$ ruby server.rb --listen-wait 3
$ ruby http_get_read_timeout.rb 1
Listen http://0.0.0.0:8080
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --accept-wait 3 | http_get_open_timeout.rb 1
$ ruby server.rb --accept-wait 3
Listen http://0.0.0.0:8080
$ ruby http_get_open_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --accept-wait 3 | http_get_read_timeout.rb 1
$ ruby server.rb --accept-wait 3
Listen http://0.0.0.0:8080
$ ruby http_get_read_timeout.rb 1
Exit
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:153:in `read_nonblock': Connection reset by peer (Errno::ECONNRESET)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:153:in `rbuf_fill'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:134:in `readuntil'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:144:in `readline'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:39:in `read_status_line'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:28:in `read_new'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1414:in `block in transport_request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `catch'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `transport_request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1384:in `request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1133:in `get'
        from http_get_read_timeout.rb:8:in `block in <main>'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:853:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'

------------------------------------------------
# --write-wait 3 | http_get_open_timeout.rb 1
$ ruby server.rb --write-wait 3
Listen http://0.0.0.0:8080
$ ruby http_get_open_timeout.rb 1
Exit
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --write-wait 3 | http_get_read_timeout.rb 1
$ ruby server.rb --write-wait 3
Listen http://0.0.0.0:8080
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:158:in `rescue in rbuf_fill': Net::ReadTimeout (Net::ReadTimeout)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:152:in `rbuf_fill'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:134:in `readuntil'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:144:in `readline'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:39:in `read_status_line'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:28:in `read_new'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1414:in `block in transport_request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `catch'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `transport_request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1384:in `request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1133:in `get'
        from http_get_read_timeout.rb:8:in `block in <main>'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:853:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
Exit
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
$ ruby http_get_read_timeout.rb 1
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `initialize': Connection refused - connect(2) for "localhost" port 8080 (Errno::ECONNREFUSED)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `open'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:879:in `block in connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/timeout.rb:73:in `timeout'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:878:in `connect'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:863:in `do_start'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:852:in `start'
        from http_get_read_timeout.rb:8:in `<main>'

------------------------------------------------
# --close-wait 3 | http_get_open_timeout.rb 1
$ ruby server.rb --close-wait 3
Listen http://0.0.0.0:8080
$ ruby http_get_open_timeout.rb 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world

------------------------------------------------
# --close-wait 3 | http_get_read_timeout.rb 1
$ ruby server.rb --close-wait 3
Listen http://0.0.0.0:8080
$ ruby http_get_read_timeout.rb 1
Exit
/Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:153:in `read_nonblock': Connection reset by peer (Errno::ECONNRESET)
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:153:in `rbuf_fill'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:134:in `readuntil'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/protocol.rb:144:in `readline'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:39:in `read_status_line'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http/response.rb:28:in `read_new'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1414:in `block in transport_request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `catch'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1411:in `transport_request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1384:in `request'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:1133:in `get'
        from http_get_read_timeout.rb:8:in `block in <main>'
        from /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/2.2.0/net/http.rb:853:in `start'
        from http_get_read_timeout.rb:8:in `<main>'
$ ruby http_get_read_timeout.rb 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
```
