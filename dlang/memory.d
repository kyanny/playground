import std.stdio: writeln;

void safeFun() @safe
{
  int* p = new int;
  writeln(p);
}

void unsafeFun()
{
  int* p = new int;
  int* fidding = p + 5;
  writeln(fidding);
}

void f() @safe
{
  int* p = new int;
  int* c = p + 5;
  // writeln(c);
}

void main()
{
  safeFun();
  unsafeFun();
  f();
}
