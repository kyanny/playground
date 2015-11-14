require 'rack-proxy'
require 'base64'

class MyProxy < Rack::Proxy
  def call(env)
    return super if env['HTTP_PROXY_AUTHORIZATION'].nil?

    credentials = env['HTTP_PROXY_AUTHORIZATION']
    _, token68 = credentials.split(' ')
    # assume auth_scheme is "Basic"
    user, pass = Base64.decode64(token68).split(':')

    if user == 'user' && pass == 'pass'
      super
    else
      [407, {'Proxy-Authenticate' => 'Basic'}, ['Proxy Authentication Required']]
    end
  end
end

run MyProxy.new if File.basename($0) == 'rackup'
