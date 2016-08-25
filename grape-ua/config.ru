require 'grape'
require 'pp'

class TwitterAPI < Grape::API
  get '/' do
    env.each do |k,v|
      puts "#{k}: #{v}"
    end
    # pp headers
    # puts headers['User-Agent']
    # puts headers['user-agent']
    # puts headers['User-agent']
    # puts headers['user-Agent']
    # puts headers['USER-AGENT']
    # p env
    puts env['HTTP_USER_AGENT']
  end
end

run TwitterAPI
