def fib_seq n
  _fib_seq n, []
end

def _fib_seq n, coll
  x = case n
      when 0
        coll.push 0
      when 1
        coll.push 1
      else
        coll.push _fib_seq(n-2, coll) + _fib_seq(n-1, coll)
      end
  coll
end

puts fib_seq 5
