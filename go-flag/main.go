package main

import (
  "fmt"
  "flag"
)

func main() {
  bool := flag.Bool("bool", false, "bool value defined by --bool (or -bool)")
  var b bool
  flag.BoolVar(&b, "b", false, "bool value defined by -b")
  //
  //
  // var b bool
  //
  // num := flag.Int("num", 0, "num of count")
  // yes := flag.Bool("yes", false, "Bool flag")
  // flag.BoolVar(&b, "bool", false, "Bool flag 2")
  // flag.Parse()
  //
  // fmt.Printf("Arg[0] = %v\n", flag.Arg(0))
  // fmt.Printf("Arg[1] = %v\n", flag.Arg(1))
  //
  // fmt.Printf("Args = %v\n", flag.Args())
  //
  // fmt.Printf("Bool 2 = %v\n", b)
  // // fmt.Printf("%v", flag.ErrHelp)
  //
  // for i := 0; i < *num; i++ {
  //   if *yes {
  //     fmt.Printf("%d: Yes we can!\n", i)
  //   } else {
  //     fmt.Printf("%d: Hello, world!\n", i)
  //   }
  // }
}
