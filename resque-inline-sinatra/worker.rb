require 'resque'
Resque.redis = 'localhost:6379'

class MyWorker
  @queue = :my_worker
  def self.perform
    raise
  end
end
