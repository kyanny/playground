require_relative 'app'
require 'test/unit'
require 'net/http'
require 'uri'
require 'webmock/test_unit'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

class AppTest < Test::Unit::TestCase

  def test_req
    VCR.use_cassette("local") do
      res = Net::HTTP.get_response(URI('http://localhost:9292'))
      assert res.ok?
    end
  end
end
