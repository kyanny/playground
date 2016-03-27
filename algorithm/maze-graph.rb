#!/usr/bin/env ruby

class Node
  attr_accessor :node_id, :edges
  def initialize(node_id, edges)
    @node_id = node_id
    @edges = edges
  end
end

class Edge
  attr_accessor :cost, :node_id
  def initialize(cost, node_id)
    @cost = cost
    @node_id = node_id
  end
end

#     c
#    /
#   b - d
#  / \   \
# a   \   f - g
#      \ /
#       e
#
# data = {
#   a => [ [1, b] ],                         # [ cost, node_id ]
#   b => [ [1, a], [1, c], [1, d], [1, e] ],
#   c => [ [1, b] ],
#   d => [ [1, b], [1, f] ],
#   e => [ [1, b], [1, f] ],
#   f => [ [1, d], [1, e], [1, g] ],
#   g => [ [1, f] ],
# }
class Graph
  attr_accessor :nodes
  def initialize(data)
    @nodes = []
    data.each do |node_id, edges|
      _edges = []
      edges.each do |edge|
        cost = edge[0]
        _node_id = edge[1]
        _edge = Edge.new(cost, _node_id)
        _edges << _edge
      end
      node = Node.new(node_id, _edges)
      @nodes << node
    end
  end
end

nodes = {}
data = DATA.read

# アスキーアートの地図（行・列の文字列）をマス目として分解して二次元配列にする
maze = data.split("\n").map { |line| line.split(//) }

maze.each_with_index do |line, y|
  line.each_with_index do |c, x|
    case c
    when 'S'
      node_id = 'S'
    when 'G'
      node_id = 'G'
    when ' '
      node_id = [x,y]
    else
      next
    end

    edges = []
    # x 1 x
    # 2 o 3
    # x 4 x
    #
    # 1 == [0, -1]
    # 2 == [-1, 0]
    # 3 == [+1, 0]
    # 4 == [0, +1]
    top_node = maze[x, y-1]
    case top_node
    when 'S'
      cost = 1
      node = [cost, [x, y-1]]
      edges << node
    when 'G'
      cost = 1
      node = [cost, [x, y-1]]
      edges << edge
    when ' '
      cost = 1
      node = [cost, [x, y-1]]
      edges << edge
    else
      # 壁なので edge ではない, 無視
    end

    left_node = maze[x-1, y]
    case left_node
    when 'S'
      node = [1, [x-1, y]]
      edges << node
    when 'G'
      node = [1, [x-1, y]]
      edges << node
    when ' '
      node = [1, [x-1, y]]
      edges << node
    else
    end

    right_node = maze[x+1, y]
    case right_node
    when 'S'
      edges << [1, [x+1, y]]
    when 'G'
      edges << [1, [x+1, y]]
    when ' '
      edges << [1, [x+1, y]]
    end

    bottom_node = maze[0, y+1]
    case bottom_node
    when 'S', 'G', ' '
      edges << [1, [x+1, y]]
    end

    nodes[node_id] = edges
  end
end

g = Graph.new(nodes)
p g

__END__
**************************
*S* *                    *
* * *  *  *************  *
* *   *    ************  *
*    *                   *
************** ***********
*                        *
** ***********************
*      *              G  *
*  *      *********** *  *
*    *        ******* *  *
*       *                *
**************************
