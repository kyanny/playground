def main s
  k = s.split(//).group_by{|x|x}.select{|x,y|y.length.even?}.keys.length

  if k == 0
    s.length
  else
    (s.length - 1)/2
  end
end

#puts main 'rokovoko'
#puts main 'tomtom'
puts main 'vwxyz'
#puts main gets.chomp
