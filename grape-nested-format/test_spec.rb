require_relative 'app'
require 'rack/test'
require 'byebug'

describe 'post' do
  include Rack::Test::Methods

  def app
    TwitterAPI
  end

  it '...' do
    byebug
    # break /Users/kyanny/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/grape-0.12.0/lib/grape/endpoint.rb:47
    # break Grape::Endpoint.call!
    # break Grape::Endpoint.run
    begin
      post '/base/v1//x/y', hello: "world!"
    rescue => e
      puts e.backtrace
      raise
    end
    p last_response
  end
end
