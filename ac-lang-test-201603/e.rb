def main stdin
  lines = stdin.split("\n")
  lines.shift
  lines.map!(&:to_i).sort!.reverse!
  radius = lines
  answer = radius.map.with_index(1) {|r, i|
    if i.odd?
      r*r
    elsif i.even?
      -(r*r)
    end
  }.inject(0) { |total, area|
    total += area
    total
  } * Math::PI
  puts answer
end

main $stdin.read
