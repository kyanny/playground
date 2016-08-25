require 'grape'
require 'ostruct'
require 'byebug'

class TwitterAPI < Grape::API
  default_format :json
  get '/' do
    res = OpenStruct.new(code: 200)
    status res.code
    byebug
    present res
  end
end

run TwitterAPI
