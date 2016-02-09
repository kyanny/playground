a = []
i = 0
c = 'a'
m = Mutex.new
t1 = Thread.new {
  slp = [0.09, 0.11].sample
  p "Sleep #{slp}"
  sleep slp
  p 't1 start'
  m.synchronize {
    until i >= 10
      a << i
      i += 1
      sleep 0.1
    end
  }
}
t2 = Thread.new {
  sleep 0.1
  p 't2 start'
  m.synchronize {
    until c == 'aa'
      a << c.dup
      c.succ!
      sleep 0.1
    end
  }
}

t1.join
t2.join
p a
p i
p c
