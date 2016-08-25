def main stdin
  lines = stdin.split("\n")
  answers = lines[1].split(//).group_by { |answer|
    answer
  }.map { |k,v| [k, v.length] }.to_h.tap do |h|
    oh = %w[1 2 3 4].map { |k|
      [k, 0]
    }.to_h
    h.merge!(oh) do |k, o, n|
      o
    end
  end
  max = answers.values.max
  min = answers.values.min
  puts "#{max} #{min}"
end

main $stdin.read
