require 'rack'
require 'benchmark/ips'

env = {
  'HTTP_X_REQUEST_ID' => '0123456789abcdef',
  'HTTP_HOST' => 'example.quipper.com',
  'rack.session' => {'user_id' => 'abc123' },
  'REMOTE_ADDR' => '10.23.45.67',
  'REQUEST_METHOD' => 'GET',
  'PATH_INFO' => '/some/path',
  'QUERY_STRING' => 'foo=bar',
  'HTTP_REFERER' => 'example.quipper.net',
  'HTTP_USER_AGENT' => 'Some Browser',
  'CONTENT_TYPE' => 'application/x-www-form-urlencoded',
  'rack.input' => ->{
    body = StringIO.new
    body.print('key=value&flag=true')
    body.rewind
    body
  }.call
}

Benchmark.ips do |x|
  x.report('Rack::Request') {
    req = Rack::Request.new(env)
    path = req.path
    user_agent = req.user_agent
    ['/foo', '/bar', '/baz'].none? { |e| e === path } && ['IE', 'Chrome', 'Firefox'].none? { |e| e === user_agent }
  }

  x.report('env Hash') {
    path = env['PATH_INFO'].to_s
    user_agent = env['HTTP_USER_AGENT'].to_s
    ['/foo', '/bar', '/baz'].none? { |e| e === path } && ['IE', 'Chrome', 'Firefox'].none? { |e| e === user_agent }
  }

  x.compare!
end
