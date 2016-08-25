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

nodes = {}
nodes[:a] = [:a, [:b, :e, :f]]
nodes[:b] = [:b, [:a, :c, :f]]
nodes[:c] = [:c, [:b, :d, :g]]
nodes[:d] = [:d, [:c]]
nodes[:e] = [:e, [:a, :f, :h]]
nodes[:f] = [:f, [:a, :b, :e, :g, :i, :j]]
nodes[:g] = [:g, [:c, :f, :j]]
nodes[:h] = [:h, [:e, :i]]
nodes[:i] = [:i, [:f, :h, :j]]
nodes[:j] = [:j, [:f, :g, :i, :k]]
nodes[:k] = [:k, [:j]]

p nodes

found, route = dfs(nodes: nodes, start: :a, goal: :k)
if found
  print_route(route)
else
  puts 'not found'
end

__END__
# http://tokyo-ct.net/usr/kosaka/for_students/jissen1/akiyojissen1/kougi25.html

H--I--J--K
|  | /|
|  |/ |
E--F--G
| /|  |
|/ |  |
A--B--C--D
