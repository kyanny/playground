require 'sinatra'
require_relative 'worker'

Resque.inline = !!ENV['INLINE']

get '/' do
  Resque.enqueue MyWorker
  "ok"
end
