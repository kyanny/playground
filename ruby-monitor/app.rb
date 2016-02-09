require 'monitor'

a = []
i = 0
mon = Monitor.new
cv = mon.new_cond

t1 = Thread.new {
  mon.synchronize {
    mon.synchronize {
      if a.length.zero? or a.length >= 10
        cv.wait
      end
      until a.length.zero?
        p a.shift
        sleep 0.01
      end
    }
  }
}

t2 = Thread.new {
  mon.synchronize {
    16.times {
      16.times {
        a << i
        i += 1
      }
      # cv.broadcast
    }
  }
}

p t1
p t2
p t1



t1.join
t2.join
