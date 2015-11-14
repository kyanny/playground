Rack::Proxy Proxy Authorization example
=======================================

MIT License

```
$ rackup
$ curl -I -x localhost:9292 -U user:pass example.com
#=> 200 OK
$ curl -I -x localhost:9292 -U xxx:xxx   example.com
#=> 407 Proxy Authentication Required
```

`$ rake` -> https://gist.github.com/kyanny/7faac9c42ba1c2672151
