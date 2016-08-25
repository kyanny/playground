#!/usr/bin/env ruby
require 'pp'

def log(msg)
  debug = true
  p msg if debug
end

# nodes[id] = [id, [adjacent_id, adjacent_id, adjacent_id]]
def dfs(nodes: , start: , goal: )
  visited = {}
  from = {}

  stack = []
  stack.push nodes[start]

  while node = stack.shift
    p '--'
    p node
    p '-'
    id = node[0]
    adjacents = node[1]

    log "visiting #{id}"
    if id == goal
      route = []
      cur = goal
      route << cur
      while prev = from[cur]
        cur = prev
        route << cur
      end
      return [true, route]
    end

    adjacents.each do |adjacent|
      log "adjacent: #{adjacent}"
      unless visited[adjacent]
        stack.push nodes[adjacent]
        unless from[adjacent]
          log "adjacent: #{adjacent} is coming from #{id}"
          from[adjacent] = id
        end
      end
    end

    visited[id] = true
  end

  return [false, nil]
end

def print_route(route)
  puts route.reverse.map { |r|
    "(#{r})"
  }.join(" -> ")
end


maze = File.read('maze1.txt').split("\n").map { |line|
  line.split(//)
}
nodes = {}
start = nil
goal = nil
maze.each_with_index do |line, y|
  line.each_with_index do |c, x|
    case c
    when 'S'
      start = [x,y]
    when 'G'
      goal = [x,y]
    when ' '
    else
      next
    end

    [
      [x,y-1], [x,y+1], [x-1,y], [x+1,y]
    ].each do |_x,_y|
      if nodes[[_x,_y]]
        next
      end
      c = maze[_y][_x]
      case c
      when 'S', 'G', ' '
        nodes[[x,y]] ||= []
        nodes[[x,y]] << [_x,_y]
      else
        next
      end
    end
  end
end

p nodes

# pp nodes
# pp start
# pp goal

found, route = dfs(nodes: nodes, start: start, goal: goal)
if found
  print_route(route)
else
  puts 'not found'
end
