def main stdin
  lines = stdin.split("\n")
  a = lines[0].to_i
  b, c = lines[1].split(" ").map(&:to_i)
  s = lines[2]
  puts "#{a + b + c} #{s}"
end

main $stdin.read
