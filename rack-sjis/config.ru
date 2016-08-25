require 'rack'
require 'cgi'
require 'uri'

run -> (env) {
  # req = Rack::Request.new(env)
  # n = req['n']
  # p n
  # p n.dup.encoding
  # p n.dup.force_encoding(Encoding::Shift_JIS)
  n = env['rack.input'].read
  p CGI.unescape(n)
  p URI.unescape(n)
  p n.class
  p n.encoding
  p CGI.unescape(n).class
  p CGI.unescape(n).encoding
  [200, {'Content-Type' => 'text/plain'}, ['ok']]
}
