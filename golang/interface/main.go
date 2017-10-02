package main

import "fmt"

type T string

type reverser interface {
	exceptLast() T
	last() T
}

func (t T) last() T {
	return T(t[len(t)-1])
}

func (t T) exceptLast() T {
	return T(t[len(t)-1:])
}

// for i:=0; i < len(s); i++
func reverse(s T) T {
	return reverser(s).exceptLast() + reverser(s).last()
}

func main() {
	str := string(reverse(T("Hello")))
	fmt.Printf(str)
}
