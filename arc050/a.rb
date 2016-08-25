def main stdin
  a, b = stdin.chomp.split(" ")
  puts a.downcase == b.downcase ? 'Yes' : 'No'
end

main $stdin.read
