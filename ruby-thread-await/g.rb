def test
  mon = Monitor.new
  cv = mon.new_cond
  a = []
  t1 = Thread.new {
    mon.synchronize {
      cv.wait
      a << 't1'
    }
  }
  t2 = Thread.new {
    mon.synchronize {
      5.times do |n|
        a << n
        cv.signal
      end
    }
  }
  t2.join
  t1.join
  p a
rescue Exception => e
  p e
  p Thread.list
  p Thread.main
  p Thread.current
end

10000.times do
  test
end
