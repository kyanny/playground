#!/usr/bin/env ruby
require 'pp'

maze = DATA.read.split("\n").map { |line| line.split(//) }

nodes = {}
maze.each.with_index do |line, y|
  line.each.with_index do |c, x|
    case c
    when 'S', 'G'
      node_id = c
    when ' '
      node_id = "#{x}:#{y}"
    else
      next
    end

    # x 1 x
    # 2 o 3
    # x 4 x
    edges_data = []
    [
      [x, y-1],
      [x-1, y],
      [x+1, y],
      [x, y+1],
    ].each do |_x, _y|
      case c = maze[_y][_x]
      when 'S', 'G'
        cost = 1
        edges_data << [cost, c]
      when ' '
        cost = 1
        edges_data << [cost, "#{_x}:#{_y}"]
      end
    end
    nodes[node_id] = edges_data
  end
end

def bfs(graph: [], start: start, goal: goal, route: [], visited: [])
  queue = []
  queue << start
  while node = queue.shift
    if visited[node]
      
    end
  end
end

#puts g

__END__
#########
#       #
#** *** #
#S    * #
# * *** #
# *   * #
# ******#
#      G#
#########
