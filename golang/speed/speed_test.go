package main

import (
	"fmt"
	"os"
	"runtime/trace"
	"testing"
)

func BenchmarkMemoryStack(b *testing.B) {
	f, err := os.Create("stack.out")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	err = trace.Start(f)
	if err != nil {
		panic(err)
	}

	for i := 0; i < b.N; i++ {
		s := byCopy()
		_ = fmt.Sprintf("%v", s.a)
	}

	trace.Stop()

	b.StopTimer()
}

func BenchmarkMemoryHeap(b *testing.B) {
	f, err := os.Create("heap.out")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	err = trace.Start(f)
	if err != nil {
		panic(err)
	}

	for i := 0; i < b.N; i++ {
		s := byPointer()
		_ = fmt.Sprintf("%v", s.a)
	}

	trace.Stop()

	b.StopTimer()
}
