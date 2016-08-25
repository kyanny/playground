def main line
  h, w = line.chomp.split(' ').map(&:to_i)
  h*(w-1) + w*(h-1)
end

#puts main "2 3"
#puts main "4 1"
#puts main "1 1"
puts main gets
