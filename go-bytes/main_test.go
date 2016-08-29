package main

import (
  "testing"
  "bytes"
  //"errors"
)

func TestMinRead(t *testing.T) {
  actual := bytes.MinRead
  expected := 512
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

// func TestErrTooLarge(t *testing.T) {
//   actual := bytes.ErrTooLarge
//   expected := errors.New("bytes.Buffer: too large")
//   if actual != expected {
//     t.Errorf("got %v\nwant %v", actual, expected)
//   }
// }

func TestCompare_a_b(t *testing.T) {
  a := []byte("a")
  b := []byte("b")
  actual := bytes.Compare(a, b)
  expected := -1
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}
func TestCompare_a_a(t *testing.T) {
  a := []byte("a")
  b := []byte("a")
  actual := bytes.Compare(a, b)
  expected := 0
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_c_b(t *testing.T) {
  a := []byte("c")
  b := []byte("b")
  actual := bytes.Compare(a, b)
  expected := 1
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_empty_a(t *testing.T) {
  a := []byte{} // []byte{} == empty byte array https://golang.org/ref/spec#Conversions
  b := []byte("a")
  actual := bytes.Compare(a, b)
  expected := -1
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_a_empty(t *testing.T) {
  a := []byte("a")
  b := []byte(nil) // []byte(nil) == empty byte array https://golang.org/ref/spec#Conversions
  actual := bytes.Compare(a, b)
  expected := 1
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_empty_empty(t *testing.T) {
  a := []byte{}
  b := []byte(nil)
  actual := bytes.Compare(a, b)
  expected := 0
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_nil_a(t *testing.T) {
  b := []byte("a")
  actual := bytes.Compare(nil, b)
  expected := -1
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_a_nil(t *testing.T) {
  a := []byte("a")
  actual := bytes.Compare(a, nil)
  expected := 1
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestCompare_nil_nil(t *testing.T) {
  actual := bytes.Compare(nil, nil)
  expected := 0
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContains_true(t *testing.T) {
  hello := []byte("hello")
  ell := []byte("ell")
  actual := bytes.Contains(hello, ell)
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContains_false(t *testing.T) {
  hello := []byte("hello")
  helo := []byte("helo")
  actual := bytes.Contains(hello, helo)
  expected := false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}
