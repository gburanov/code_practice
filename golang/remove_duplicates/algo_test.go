package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestBasicScenario(t *testing.T) {
	xs := []string{"to", "be", "or", "not", "to", "be", "that"}
	RemoveDuplicates(&xs)
	assert.Equal(t, xs, []string{"to", "be", "or", "not", "that"})
}

func TestEmptyArray(t *testing.T) {
	xs := []string{""}
	RemoveDuplicates(&xs)
	assert.Equal(t, xs, []string{""})
}

func TestArrayOfTwoEqualItems(t *testing.T) {
	xs := []string{"same", "same"}
	RemoveDuplicates(&xs)
	assert.Equal(t, xs, []string{"same"})
}
