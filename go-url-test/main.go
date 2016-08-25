package main

import "fmt"
import "log"
import "net/url"
import "os"

func getHost(str string) string {
  u, err := url.Parse(str)
  if err != nil {
    log.Fatal(err)
  }
  return u.Host
}

func main() {
  arg := os.Args[1]
  fmt.Println(getHost(arg))
}
