#!/usr/bin/env ruby

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

graph = {
  [1,1] => [[2,1],[1,2]],
  [2,1] => [[3,1]],
  [1,2] => [[1,3]],
  [3,1] => [[3,2]],
  [3,2] => [[3,3]],
}

route = []
visited = []
found = bfs(graph, [1,1], [3,3], route, visited)

p ['bfs', found, route]
print_route(route)
p visited

__END__
 01234x
0*****
1*S  *
2* * *
3* *G*
4*****
y
