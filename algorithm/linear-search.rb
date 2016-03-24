#!/usr/bin/env ruby

def search(items, target, debug=false)
  len = items.length
  len.times do |i|
    elem = items[i]
    if debug
      warn "#{i}: #{elem}"
    end
    if elem == target
      return elem
    end
  end
end

puts '-'*78
found = search([3, 9, 8, 2, 1, 4, 6, 5, 7], 6, true)
puts found

puts '-'*78
found = search([3, 9, 8, 2, 1, 4, 6, 5, 7], 6)
puts found
