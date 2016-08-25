r,w = IO.pipe
Thread.new do
  w.write Time.now.to_i
  # w.close
end
rs, _ = IO.select([r])
p rs
rs.each do |r|
  p r.read
end

# r1, w1 = IO.pipe
# r2, w2 = IO.pipe
# Thread.new(w1) do |w|
#   w.write Time.now.utc.to_i
#   w.close
# end
# loop do
#   rs, ws = IO.select([r1, r2], [w1, w2], [], 1)
#   if !rs.empty?
#     rs.each do |r|
#       puts r.read
#     end
#   end
# end
