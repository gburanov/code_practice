# Array

my_dog = %w(my dog barks like a cat)
my_cat = %w(and my cat meows like a dog)

my_dog_test = %w(my DOG barks like a cat)

# a) PLEASE implement the function as_sentence
#    WHICH RECEIVES an array of words
#    AND joins all words by a given delimiter
#    AND appends a period '.' at the end
#
#    EXAMPLE: as_sentence(my_dog, ' ')
#    RETURNS: "my dog barks like a cat."
def as_sentence(array, delimiter = nil)
  array.join(delimiter) + "."
end

# b) PLEASE implement the function funky
#    WHICH RECEIVES an array of words
#    AND swaps the case for the i-th letter of every word
#
#    EXAMPLE: funky!(my_dog, 1)
#    RETURNS: ["mY","dOg","bArks","lIke","a","cAt"]

def swap_letter(str, i)
  letter = str[i]
  str[i] = letter.swapcase if letter
  str
end

def funky!(array, i = 0)
  array = array.map { |item| swap_letter(item, i)}
  array
end

# c) PLEASE implement the function disjoint_set
#    WHICH RECEIVES two arrays
#    AND computes a disjoint set out of these two arrays
#
#    Note: Given sets A and B, a disjoint set is a set that
#    consists of all elements that either only exist in A
#    or only exist in B but not in both A and B
#
#    EXAMPLE: disjoint_set(my_dog, my_cat)
#    RETURNS: ["barks", "and" , "meows"]
def disjoint_set(a, b)
  a + b - a & b
end

require 'rspec'

describe Object do
  context "as_sentence works" do
    it "works" do
      expect(disjoint_set(my_dog, my_cat)).to eq ["barks", "and" , "meows"]
    end

  end
end
