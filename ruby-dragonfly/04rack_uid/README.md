Dragonfly: 04 Rack
==================

```
$ ./01put.rb
# => http://localhost:9292/2015/09/19/7ipckels28_index.html
$ rackup
$ curl -i http://localhost:9292/2015/09/19/7ipckels28_index.html
# => HTTP/1.1 200 OK
#    Content-Type: text/html
#    Transfer-Encoding: chunked
#    Connection: close
#    Server: thin
#    
#    <!DOCTYPE html><html><head></head><body></body></html>
```
