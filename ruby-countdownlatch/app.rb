class CountDownLatch
  def initialize(count)
    raise ArgumentError, 'count < 0' if count < 0
    @count = count
    @lock = Monitor.new
    @condition = @lock.new_cond
  end

  def count_down
    @lock.synchronize do
      @count -= 1 if @count > 0
      @condition.broadcast if @count == 0
    end
  end

  def await
    @lock.synchronize do
      @condition.wait if @count > 0
    end
  end
end

class Middleware
  attr_reader :cnt

  def call
    Thread.new {
      sleep 0.1
      @cnt = 1
    }
  end
end

class App
  def initialize(latch)
    @latch = latch
    @mid = ::Middleware.new
  end

  def call
    @mid.call
    @latch.count_down
    @mid.cnt
  end
end

counter = CountDownLatch.new(2)
app = App.new(counter)
cnt = app.call
p cnt
