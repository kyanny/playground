require 'sinatra'

get '/' do
  @values = []
  erb :index
end

get '/log' do
  p params['key']
  puts '{ok:1}'
end

post '/' do
  hex = Digest::SHA1.hexdigest("ほげふがabc123")
  sjis_hex = Digest::SHA1.hexdigest("ほげふがabc123".encode(Encoding::Shift_JIS))

  @values = ["UTF-8 hex is #{hex}", "Shift_JIS hex is #{sjis_hex}", "client side hex is #{params['hex']}", "is match = #{hex == params['hex']}"]

  erb :index
end
