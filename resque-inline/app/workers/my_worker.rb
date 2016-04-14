class MyWorker
  @queue = :my_worker

  def self.perform id
    puts id
    raise RuntimeError
  end
end
