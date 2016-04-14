class WelcomeController < ApplicationController
  def index
    p '='*78
    job = Object.new
    Resque.enqueue MyWorker, job.object_id
    p '='*78
    render json: {ok: true}, content_type: 'text/plain'
  end
end
