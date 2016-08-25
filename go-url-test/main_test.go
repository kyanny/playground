package main

import "testing"

func TestGetHost(t *testing.T) {
  actual := getHost("http://example.com")
  expected := "example.com"
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}

func TestGetHostByEmptyString(t *testing.T) {
  actual := getHost("")
  expected := "bad result"
  if actual != expected {
    t.Errorf("got %v\nwant %v", actual, expected)
  }
}
