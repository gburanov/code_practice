package main

import "fmt"

func main() {
	xs := []string{"to", "be", "or", "not", "to", "be", "that"}
	RemoveDuplicates(&xs)
	fmt.Println(xs)
}
