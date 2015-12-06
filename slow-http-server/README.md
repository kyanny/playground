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
# No wait & timeout
$ ruby server.rb
$ curl -isS localhost:8080
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit

------------------------------------------------
# --new-wait 2 | --connect-timeout 1
$ ruby server.rb --new-wait 2
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
# --new-wait 2 | --max-time 1
$ ruby server.rb --new-wait 2
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
# --bind-wait 2 | --connect-timeout 1
$ ruby server.rb --bind-wait 2
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
# --bind-wait 2 | --max-time 1
$ ruby server.rb --bind-wait 2
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
# --listen-wait 2 | --connect-timeout 1
$ ruby server.rb --listen-wait 2
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
# --listen-wait 2 | --max-time 1
$ ruby server.rb --listen-wait 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Connection timed out after 1003 milliseconds
$ curl -isS localhost:8080 --max-time 1
HTTP/1.0 200 OK
Content-Length: 12

Hello world
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --accept-wait 2 | --connect-timeout 1
$ ruby server.rb --accept-wait 2
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
# --accept-wait 2 | --max-time 1
$ ruby server.rb --accept-wait 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Operation timed out after 1002 milliseconds with 0 bytes received
Listen http://0.0.0.0:8080
Exit
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --write-wait 2 | --connect-timeout 1
$ ruby server.rb --write-wait 2
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
# --write-wait 2 | --max-time 1
$ ruby server.rb --write-wait 2
$ curl -isS localhost:8080 --max-time 1
curl: (28) Operation timed out after 1004 milliseconds with 0 bytes received
$ curl -isS localhost:8080 --max-time 1
Listen http://0.0.0.0:8080
Exit
curl: (7) Failed to connect to localhost port 8080: Connection refused
$ curl -isS localhost:8080 --max-time 1
curl: (7) Failed to connect to localhost port 8080: Connection refused

------------------------------------------------
# --close-wait 2 | --connect-timeout 1
$ ruby server.rb --close-wait 2
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
# --close-wait 2 | --max-time 1
$ ruby server.rb --close-wait 2
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
