import std.stdio: writeln;

void main() {
  int b = 7_000_000;
  writeln(typeid(b));
  auto f = 3.14;
  writeln(typeid(f));
  writeln(int.init);
  // assert(0);
  
}
