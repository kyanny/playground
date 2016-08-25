require 'grape'

class TwitterAPI < Grape::API
  format :json
  resources 'twitter' do
    params do
      requires :followers, type: Integer
      requires :followings, type: String
    end
    get '/' do
      {
        followers: params.followers,
        followings: params.followings,
      }
    end
  end
end

run TwitterAPI
