require 'rack-proxy'
require 'base64'

class MyProxy < Rack::Proxy
  def rewrite_env env
    @@old ||= self.method(:perform_request)
    @@new ||= proc { [407, {'Proxy-Authenticate' => 'Basic'}, ['Proxy Authentication Required']] }

    return env if env['HTTP_PROXY_AUTHORIZATION'].nil?

    credentials = env['HTTP_PROXY_AUTHORIZATION']
    _, token68 = credentials.split(' ')
    # assume auth_scheme is "Basic"
    user, pass = Base64.decode64(token68).split(':')
    if user == 'user' && pass == 'pass'
      def self.perform_request(env)
        @@old.call(env)
      end
      env
    else
      def self.perform_request(env)
        @@new.call(env)
      end
      env
    end
  end

  def rewrite_response triplet
    triplet
  end
end

run MyProxy.new if File.basename($0) == 'rackup'
