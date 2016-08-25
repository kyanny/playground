require 'rack'
require 'rack/cors'
require 'cgi'
require 'digest/sha1'

use Rack::Cors do
  allow do
    origins 'localhost:8080'
    resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
  end
end

$secret = 'abc123'

run -> (env) {
  req = Rack::Request.new(env)
  key1 = req['key1']
  key2 = req['key2']
  sig = req['sig']
  checksum = Digest::SHA1.hexdigest(key1 + key2 + $secret)
  x = Digest::SHA1.hexdigest("ほげ" + "ふが" + $secret)
  y = Digest::SHA1.hexdigest(
    "ほげ".encode("Shift_JIS") + "ふが".encode("Shift_JIS") + $secret
  )
  p [key1, key2, sig, checksum, x, y]
  # input = env['rack.input'].read
  # p input
  # val = input.match(/\Aname=(.*)\z/)[1]
  # p val
  # p x = CGI.unescape(val)
  # p x == "ほげ"               # UTF-8
  # p x == "\u307b\u3052"       # Unicode
  [302, {'Location' => 'http://localhost:8080/'}, ['']]
}
