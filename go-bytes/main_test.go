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

func TestContains_a_nil(t *testing.T) {
  a := []byte("a")
  actual := bytes.Contains(a, nil)
  expected := true // false を期待したが実際は true らしい。 length が 1 以上の byte 列には空の byte 列が含まれるということか？
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContains_nil_b(t *testing.T) {
  b := []byte("b")
  actual := bytes.Contains(nil, b)
  expected := false // こっちは当初の期待通り false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContains_nil_nil(t *testing.T) {
  actual := bytes.Contains(nil, nil)
  expected := true // かな? => あたった。
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_hello_hello(t *testing.T) {
  actual := bytes.ContainsAny([]byte("hello"), "hello")
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_hello_helo(t *testing.T) {
  actual := bytes.ContainsAny([]byte("hello"), "helo")
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_helo_hello(t *testing.T) {
  actual := bytes.ContainsAny([]byte("helo"), "hello")
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_hello_e(t *testing.T) {
  actual := bytes.ContainsAny([]byte("hello"), "e")
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}
func TestContainsAny_e_hello(t *testing.T) {
  actual := bytes.ContainsAny([]byte("e"), "hello")
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_hello_x(t *testing.T) {
  actual := bytes.ContainsAny([]byte("hello"), "x")
  expected := false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_x_hello(t *testing.T) {
  actual := bytes.ContainsAny([]byte("x"), "hello")
  expected := false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}
// bytes.ContainsAny は string のどれか一文字でも []byte に含まれていたら true を返す

func TestContainsAny_hello_empty(t *testing.T) {
  actual := bytes.ContainsAny([]byte("hello"), "")
  expected := false // これは false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_nil_hello(t *testing.T) {
  actual := bytes.ContainsAny([]byte(nil), "hello")
  expected := false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsAny_nil_empty(t *testing.T) {
  actual := bytes.ContainsAny([]byte{}, "")
  expected := false
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestContainsRune(t *testing.T) {
  b := []byte("hello")
  r := 'e' // []rune("e") はシーケンスになっちゃって型が違うのでダメ。 'a' は char かとおもいきや rune としてもいける。
  actual := bytes.ContainsRune(b, r)
  expected := true
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}
