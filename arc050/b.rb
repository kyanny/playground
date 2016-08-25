def make_red r, b, x, y
  n = 0

  while r >= x and b > 0
    r -= x
    b -= 1
    n += 1
    p [n, r, b]
  end

  [n, r, b, x, y]
end

def make_blue r, b, x, y
  m = 0

  while b >= y and r > 0
    r -= 1
    b -= y
    m += 1
    p [m, r, b]
  end

  [m, r, b, x, y]
end

def main stdin
  lines = stdin.split("\n").map(&:chomp)

  r, b = lines[0].split(" ").map(&:to_i)
  x, y = lines[1].split(" ").map(&:to_i)
  # 赤x青1の花束を作れるだけ作る
  n1, r, b, x, y = make_red r, b, x, y
  # 残りで赤1青yの花束を作れるだけ作る
  n2, r, b, x, y = make_blue r, b, x, y

  r, b = lines[0].split(" ").map(&:to_i)
  x, y = lines[1].split(" ").map(&:to_i)
  # 赤1青yの花束を作れるだけ作る
  m1, r, b, x, y = make_blue r, b, x, y
  # 残りで赤x青1の花束を作れるだけ作る
  m2, r, b, x, y = make_red r, b, x, y

  puts [n1+n2, m1+m2].max
end

# main $stdin.read

main <<S
10000000000 10000000000
4 3
S
