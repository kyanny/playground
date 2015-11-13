require 'rack-proxy'
require 'pp'

class MyProxy < Rack::Proxy
  def rewrite_env env
    pp env
    env
  end

  def rewrite_response triplet
    pp triplet
    triplet
  end
end

run MyProxy.new
