```
$ rackup
$ curl --proxy http://localhost:9292 http://example.com
```

```
$ curl -I -x http://localhost:9292 http://example.com
HTTP/1.1 200 OK
accept-ranges: bytes
cache-control: max-age=604800
content-type: text/html
date: Fri, 13 Nov 2015 17:30:52 GMT
etag: "359670651"
expires: Fri, 20 Nov 2015 17:30:52 GMT
last-modified: Fri, 09 Aug 2013 23:54:35 GMT
server: ECS (pae/3796)
x-cache: HIT
x-ec-custom-error: 1
content-length: 1270
Connection: keep-alive

```

```
$ rackup
Thin web server (v1.6.4 codename Gob Bluth)
Maximum connections set to 1024
Listening on localhost:9292, CTRL+C to stop
{"SERVER_SOFTWARE"=>"thin 1.6.4 codename Gob Bluth",
 "SERVER_NAME"=>"example.com",
 "rack.input"=>
  #<Rack::Lint::InputWrapper:0x007fc3a98380f0
   @input=#<StringIO:0x007fc3a98d2e20>>,
 "rack.version"=>[1, 0],
 "rack.errors"=>
  #<Rack::Lint::ErrorWrapper:0x007fc3a98380c8 @error=#<IO:<STDERR>>>,
 "rack.multithread"=>false,
 "rack.multiprocess"=>false,
 "rack.run_once"=>false,
 "REQUEST_METHOD"=>"HEAD",
 "REQUEST_PATH"=>"/",
 "PATH_INFO"=>"/",
 "REQUEST_URI"=>"/",
 "HTTP_VERSION"=>"HTTP/1.1",
 "HTTP_HOST"=>"example.com",
 "HTTP_USER_AGENT"=>"curl/7.43.0",
 "HTTP_ACCEPT"=>"*/*",
 "HTTP_PROXY_CONNECTION"=>"Keep-Alive",
 "GATEWAY_INTERFACE"=>"CGI/1.2",
 "SERVER_PORT"=>"80",
 "QUERY_STRING"=>"",
 "SERVER_PROTOCOL"=>"HTTP/1.1",
 "rack.url_scheme"=>"http",
 "SCRIPT_NAME"=>"",
 "REMOTE_ADDR"=>"127.0.0.1",
 "async.callback"=>#<Method: Thin::Connection#post_process>,
 "async.close"=>#<EventMachine::DefaultDeferrable:0x007fc3a985be88>,
 "rack.tempfiles"=>[]}
[200,
 {"accept-ranges"=>["bytes"],
  "cache-control"=>["max-age=604800"],
  "content-type"=>["text/html"],
  "date"=>["Fri, 13 Nov 2015 17:29:58 GMT"],
  "etag"=>["\"359670651\""],
  "expires"=>["Fri, 20 Nov 2015 17:29:58 GMT"],
  "last-modified"=>["Fri, 09 Aug 2013 23:54:35 GMT"],
  "server"=>["ECS (pae/3796)"],
  "x-cache"=>["HIT"],
  "x-ec-custom-error"=>["1"],
  "content-length"=>["1270"]},
 #<Rack::HttpStreamingResponse:0x007fc3aa034600
  @host="example.com",
  @port=80,
  @read_timeout=60,
  @request=#<Net::HTTP::Head HEAD>,
  @response=#<Net::HTTPOK 200 OK readbody=false>,
  @session=#<Net::HTTP example.com:80 open=true>,
  @use_ssl=false>]
127.0.0.1 - - [14/Nov/2015:02:29:58 +0900] "HEAD / HTTP/1.1" 200 ["1270"] 0.2872
^CStopping ...
```
