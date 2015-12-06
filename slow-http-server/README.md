Slow HTTP server
================

You can specify wait time for several steps of TCP server socket operation.

```
$ ruby server.rb -h
Usage: server [options]
        --new-timeout=VAL
        --bind-timeout=VAL
        --listen-timeout=VAL
        --accept-timeout=VAL
        --write-timeout=VAL
        --close-timeout=V
```

You can specify HTTP response data of server.

```
$ curl -i example.com > resp.txt
$ ruby server.rb resp.txt
```

Tests with `curl(1)`'s timeout options.

```
$ ./curl.sh | tee a.txt
# No timeout
$ ruby server.rb
$ curl -isS localhost:8080
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit

------------------------------------------------
# --new-timeout 2 | --connect-timeout 1
$ ruby server.rb --new-timeout 2
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit

------------------------------------------------
# --new-timeout 2 | --max-time 1
$ ruby server.rb --new-timeout 2
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit

------------------------------------------------
# --bind-timeout 2 | --connect-timeout 1
$ ruby server.rb --bind-timeout 2
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit

------------------------------------------------
# --bind-timeout 2 | --max-time 1
$ ruby server.rb --bind-timeout 2
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit

------------------------------------------------
# --listen-timeout 2 | --connect-timeout 1
$ ruby server.rb --listen-timeout 2
$ curl -isS localhost:8080 --connect-timeout 1
curl: (28) Connection timed out after 1005 milliseconds
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --listen-timeout 2 | --max-time 1
$ ruby server.rb --listen-timeout 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Connection timed out after 1001 milliseconds
$ curl -isS localhost:8080 --max-time 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --accept-timeout 2 | --connect-timeout 1
$ ruby server.rb --accept-timeout 2
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --accept-timeout 2 | --max-time 1
$ ruby server.rb --accept-timeout 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Operation timed out after 1005 milliseconds with 0 bytes received
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --write-timeout 2 | --connect-timeout 1
$ ruby server.rb --write-timeout 2
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --write-timeout 2 | --max-time 1
$ ruby server.rb --write-timeout 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Operation timed out after 1001 milliseconds with 0 bytes received
$ curl -isS localhost:8080 --max-time 1
Listen http://0.0.0.0:8080
Exit
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --close-timeout 2 | --connect-timeout 1
$ ruby server.rb --close-timeout 2
$ curl -isS localhost:8080 --connect-timeout 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
$ curl -isS localhost:8080 --connect-timeout 1
curl: (56) Recv failure: Connection reset by peer
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --connect-timeout 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --close-timeout 2 | --max-time 1
$ ruby server.rb --close-timeout 2
$ curl -isS localhost:8080 --max-time 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
$ curl -isS localhost:8080 --max-time 1
curl: (56) Recv failure: Connection reset by peer
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
