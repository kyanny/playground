def main stdin
  lines = stdin.split("\n")
  lines.shift
  lines.each do |line|
    a,b,c = line.split(" ").map(&:to_i)
    res = []
    1000.times do |x|
      if ((a * x * x) + (b * x) + c) == 0
        res << x.to_f
      end
      if res.length > 2
        break
      end
    end

    if res.length > 2
      puts '3'
    else
      puts "#{res.length} #{res.join(" ")}"
    end
  end
end

main <<S
3
1 -3 2
-10 30 -20
100 -300 200
S
