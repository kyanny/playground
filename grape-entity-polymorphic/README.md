grape-entity-polymorphic (sample code)
======================================

```
$ bundle install
```

## `SSD` class entity with `if` workaround

No errors.

```ruby
entity :rpm, if: ->(obj, opt) { obj.respond_to?(:rpm) }
```

```
$ rackup ok.ru

$ curl -i localhost:9292/1
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 126
Connection: keep-alive
Server: thin

[{"capacity_gb":500,"rpm":5400},{"capacity_gb":2000,"rpm":7200},{"capacity_gb":256,"rpm":null},{"capacity_gb":512,"rpm":null}]

$ curl -i localhost:9292/2
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 126
Connection: keep-alive
Server: thin

[{"capacity_gb":256,"rpm":null},{"capacity_gb":512,"rpm":null},{"capacity_gb":500,"rpm":5400},{"capacity_gb":2000,"rpm":7200}]
```

## `SSD` class entity without `if` workaround

Naive polymorphism raises error.

```
$ rackup not_ok.ru

$ curl -i localhost:9292/1
HTTP/1.1 500 Internal Server Error
Content-Type: application/json
Content-Length: 84
Connection: keep-alive
Server: thin

{"error":"HDD::Entity missing attribute `rpm' on #\u003cSSD:0x007fe4653a0d80\u003e"}

$ curl -i localhost:9292/2
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 82
Connection: keep-alive
Server: thin

[{"capacity_gb":256},{"capacity_gb":512},{"capacity_gb":500},{"capacity_gb":2000}]
```