def main stdin
  lines = stdin.split("\n")
  s = lines.shift
  lines.shift
  ops = lines
  ops.each do |op|
    li, ri = op.split(" ").map(&:to_i).map {|x| x-1 }
    s[li..ri] = s[li..ri].reverse
  end
  puts s
end

main $stdin.read
