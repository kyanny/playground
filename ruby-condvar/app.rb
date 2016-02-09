a = []
c = 'a'
m = Mutex.new
cv = ConditionVariable.new

t1 = Thread.new {
  m.synchronize {
    unless a[-1] == 'z'
      cv.wait(m)
    end
    a << c.dup
    c.succ!
  }
}

t2 = Thread.new {
  m.synchronize {
    until c == 'aa'
      a << c.dup
      c.succ!
    end
    cv.broadcast
  }
}

t1.join
t2.join

p a
p c
