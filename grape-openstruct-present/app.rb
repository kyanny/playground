require 'rack'
require 'ostruct'
require 'multi_json'
require 'oj'
res = OpenStruct.new(code: 200)
body = [res]
resp = Rack::Response.new(body)
p resp

p MultiJson.dump(res)

p '--'

p Oj.dump(res, {:mode=>:compat, :time_format=>:ruby, :use_to_json=>true})
p Oj.dump(res, {:mode=>:compat, :time_format=>:ruby})
p Oj.dump(res, {:mode=>:compat})
p Oj.dump(res)

p '--'
p res.marshal_dump
p res.inspect
p res.to_s
p res.table
