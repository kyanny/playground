class Middleware
  attr_reader :cnt

  def call
    @t = Thread.new {
      sleep 1
      @cnt = 1
    }
  end

  def join
    @t.join
  end
end

class App
  def initialize
    @mid = ::Middleware.new
  end

  def call
    @mid.call
    Thread.list.tap { |list|
      list.delete Thread.main
      list.each(&:join)
    }
    @mid.cnt
  end
end

app = App.new
p app.call
