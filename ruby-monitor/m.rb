m = Mutex.new
t1 = Thread.new {
  a = []
  10000000.times { a << 0 }
  m.lock
  p 't1 lock'
  sleep 3
  m.unlock
  p 't1 unlock'
  loop {}
}
sleep 0.01
t2 = Thread.new {
  m.lock
  p 't2 lock'
  sleep 3
  m.unlock
  p 't2 unlock'
  loop {}
}

loop {
  p ['t1', t1]
  p ['t2', t2]
  sleep 1
}
