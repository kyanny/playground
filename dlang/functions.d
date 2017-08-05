import std.stdio: writeln, writefln;

int add(int lhs, int rhs)
{
  return lhs + rhs;
}

auto add2(int lhs, int rhs)
{
  return lhs + rhs;
}

auto lessOrEqual(int lhs, int rhs)
{
  if (lhs <= rhs) {
    return 0;
  } else {
    return 1.0;
  }
}

auto plot(string msg, string color = "red")
{
  return msg ~ " is " ~ color;
}

auto f(int x)
{
  int local = 10;
  int f2()
  {
    return local++;
  }
  f2();
  f2();
  return local;
}

void main()
{
  writeln(add(1, 2));

  writeln(add2(1, 2));
  // writeln(add2(1.0, 2.0));

  writefln("%f", lessOrEqual(3, 2));

  writeln(plot("D rocks"));
  writeln(plot("D rocks", "blue"));
  // writeln(plot());

  writeln(f(10));
}
