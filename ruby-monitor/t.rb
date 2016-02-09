for i in 1..5
  Thread.new { p i }
end

p '--'
sleep 1

ts = []
res = [] # XXX
for i in 1..50
  ts << Thread.new(i) { |n| res << n*2 }
end

p ts
ts.each(&:join)

p res
p res.sort
