#!/usr/bin/env ruby

def search(items, target, debug=false)
  len = items.length
  half = (len-1) / 2 # because array index is 0 origin, need -1 from length
  warn "len: #{len} half: #{half}" if debug
  elem = items[half]
  warn "elem: #{elem}" if debug
  if elem == target
    warn "found: #{elem}" if debug
    return elem
  end

  if elem < target # search right
    right = items[half+1..-1]
    warn "search right: #{right} #{target}" if debug
    search(right, target, debug)
  else # search left
    left = items[0..half-1]
    warn "search left: #{left} #{target}" if debug
    search(left, target, debug)
  end
end

puts '-'*70
found = search([1,2,3,4,5,6,7,8,9], 6, true)
puts found
