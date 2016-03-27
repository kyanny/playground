#!/usr/bin/env ruby
require 'pp'

def bfs(graph, start, goal, route, visited)
  found = false
  queue = []
  queue << start

  while node = queue.shift
    if node == goal
      found = true

      # ゴールからスタートに向かって見つかった最短ルートを追加していく
      route << goal
      from = goal
      # スタートにたどり着くまで繰り返し
      until from == start
        graph.each { |n, edges|
          # from はいまわかっている最短ルート上の末尾ノード
          # 末尾ノードに隣接している親ノードを探す
          # 親ノードが見つかったらそれを from としてスタートに向かって繰り返し
          if edges.include?(from)
            from = n
            break
          end
        }
        route << from
      end

      return found
    end

    # 訪問済みノードはスキップ
    if visited.include?(node)
      return
    end
    visited << node

    # 行き止まりノードだったらそれ以上探索できないのでスキップ
    edges = graph[node]
    next if edges.nil?

    # 隣接ノードをキューに入れる
    edges.each do |edge|
      queue << edge
    end
  end

  return found
end

def print_route(route)
  # route はゴールからスタートに向かって最短ノードが入ってるので逆順に表示する
  puts route.reverse.map { |node|
    "(#{node[0]},#{node[1]})"
  }.join(" -> ")
end

def print_solved_maze(maze, route)
  maze.each.with_index do |line, y|
    line.each.with_index do |c, x|
      if c == 'S' or c == 'G'
        print c
      elsif route.find { |node| node == [x,y] }
        print '@'
      else
        print c
      end
    end
    print "\n"
  end
end

maze = DATA.read.split("\n").map { |line|
  line.split(//)
}
graph = {}
start = nil
goal = nil
maze.each.with_index do |line, y|
  line.each.with_index do |c, x|
    case c
    when 'S'
      start = [x,y]
    when 'G'
      goal = [x,y]
    when ' '
    else
      # 行けないノードなのでスキップ
      next
    end

    # 上下左右の隣接ノードがあればエッジとして追加する
    # 上 [x, y-1]
    # 下 [x, y+1]
    # 左 [x-1, y]
    # 右 [x+1, y]
    [
      [x, y-1], [x, y+1], [x-1, y], [x+1, y]
    ].each do |_x, _y|
      # グラフに追加済みのノードはスキップ（有向グラフとみなす）
      if graph[[_x,_y]]
        next
      end

      c = maze[_y][_x]

      case c
      when 'S', 'G', ' '
        graph[[x,y]] ||= []
        graph[[x,y]] << [_x, _y]
      else
        # 行けないノードなのでスキップ
        next
      end
    end
  end
end

route = []
visited = []
found = bfs(graph, start, goal, route, visited)
print_route(route)

puts '-'*78
_graph = {
  [1,1] => [[2,1],[1,2]],
  [2,1] => [[3,1]],
  [1,2] => [[1,3]],
  [3,1] => [[3,2]],
  [3,2] => [[3,3]],
}

route = []
visited = []
found = bfs(graph, [1,1], [3,3], route, visited)
print_route(route)
print_solved_maze(maze, route)

__END__
*****
*S  *
* * *
* *G*
*****
