class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    access_token = auth_hash.credentials.token
    res = RestClient.get 'https://api.fitbit.com/1/user/-/activities/heart/date/2016-05-04/1d/1sec.json', {'Authorization' => "Bearer #{access_token}"}
    require 'pp'
    pp JSON.parse(res)
    render :text => auth_hash.inspect
  end

  def failure
  end
end
