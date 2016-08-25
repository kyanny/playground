package main

import "gopkg.in/mgo.v2"
import "gopkg.in/mgo.v2/bson"
import "log"
import "fmt"

type User struct {
  Username string
  Email string
}

func main() {
  session, err := mgo.Dial("localhost")
  if err != nil {
    panic(err)
  }
  defer session.Close()

  c := session.DB("quipper_web_development").C("users")
  result := User{}
  err = c.Find(bson.M{"username":"aya_b2c_paid_1"}).One(&result)
  if err != nil {
    log.Fatal(err)
  }

  fmt.Println(result.Username)
  fmt.Println(result.Email)
}
