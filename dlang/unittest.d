auto add(int lhs, int rhs)
{
  return lhs + rhs;
}
unittest {
  assert(add(1,2) == 3);
  assert(add(0,0) == 0);
  assert(add(-1, 1) == 0);

}

void main()
{
  // writeln(int.max);
}
