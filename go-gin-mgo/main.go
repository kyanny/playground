package main

import (
  "log"
  "github.com/gin-gonic/gin"
  "gopkg.in/mgo.v2"
  "gopkg.in/mgo.v2/bson"
)

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

  r := gin.Default()
  r.GET("/", func(context *gin.Context) {
    result := User{}
    err = c.Find(bson.M{"username":"aya_b2c_paid_1"}).One(&result)
    if err != nil {
      log.Fatal(err)
    }
    context.JSON(200, gin.H{
      "username": result.Username,
      "email": result.Email,
    })
  })
  r.Run()
}
