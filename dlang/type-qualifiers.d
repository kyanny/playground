import std.stdio: writeln;

void foo( const char[] s )
{
  // s[0] = 'x';
  writeln(s);
}

void main()
{
  immutable int err = 5;
  // err = 5;

  foo("abcd");
  foo("abcd".dup);

  int m = 100;
  writeln("m: ", typeof(m).stringof);
  m = 10;

  const int* cm = &m;
  writeln("cm: ", typeof(cm).stringof);
  // *cm = 100;

  // immutable int* im = &m;

  immutable v = 100;
  writeln("v: ", typeof(v).stringof);
  // v = 5;

  const int* cv = &v;
  writeln("cv: ", typeof(cv).stringof);
  // *cv = 10;
}
