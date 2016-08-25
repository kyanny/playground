require 'grape'

class TwitterAPI < Grape::API
  version 'v1'
  format :json
  default_format :json

  resource '/x' do
    params do
      requires :hello, type: String
    end
    post '/y' do
      content_type 'text/csv'
      body "hello,#{params.hello}"
      raise
    end
  end
end

class BaseAPI < Grape::API
  prefix "/base"
  format :json
  default_format :json
  mount TwitterAPI
end
