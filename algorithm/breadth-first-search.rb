#!/usr/bin/env ruby
require 'pp'
require 'set'

def search(graph, debug=false)
  queue = []

  root = graph.root
  warn "root: #{root.vertex}" if debug
  warn " >enq: #{root.vertex}" if debug
  queue << root

  _search(queue, debug)
end

def _search(queue, debug=false)
  while node = queue.shift
    warn "  <deq: #{node.vertex} len=#{queue.length}" if debug
    if node.goal
      warn "    found: #{node.vertex}" if debug
      return node
    else
      warn "   visit #{node.vertex}; continue"
    end

    node.edges.each do |edge|
      queue << edge
      warn "  >enq: #{edge.vertex} len=#{queue.length}" if debug
    end
  end

  return "    not found"
end

Node = Struct.new(:vertex, :edges, :start, :goal)

a = Node.new(:a, [], true)
b = Node.new(:b, [])
c = Node.new(:c, [])
d = Node.new(:d, [])
e = Node.new(:e, [])
f = Node.new(:f, [])
g = Node.new(:g, [], false, true)
h = Node.new(:h, [])
i = Node.new(:i, [])
j = Node.new(:j, [])
k = Node.new(:k, [])
l = Node.new(:l, [])

a.edges = [b, c, d]
b.edges = [e, f]
c.edges = [h]
d.edges = [i, j]
e.edges = [k]
h.edges = [g]
j.edges = [l]

Graph = Struct.new(:root)
graph = Graph.new(a)

#pp graph

found = search(graph, true)
puts found
