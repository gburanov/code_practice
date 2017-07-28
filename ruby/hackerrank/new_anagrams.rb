# Enter your code here. Read input from STDIN. Print output to STDOUT
inp = $stdin.read

class Array
  def in_groups(num_groups)
    return [] if num_groups == 0
    slice_size = (self.size/Float(num_groups)).ceil
    self.each_slice(slice_size).to_a
    end
end

class String
  def intersection(compared_to)
    common_chars = (self.split('') & compared_to.split(''))
    common_chars.inject(0) { |result, char|
      result + [self.count(char), compared_to.count(char)].min
    }
  end
end

def count_diff(a, b)
    (a.ord - b.ord).abs
end

def count_anagrams2(arr)
    ret = arr[0].intersection(arr[1])
    arr[0].size - ret
end

def count_anagrams(arr)
    puts arr.inspect
    ret = 0
    for i in 0...arr[0].size
        ret += 1 if arr[0][i] != arr[1][i]
    end
    ret
end

def count_for(line)
    return -1 if line.size.odd?
    words = line.chars.in_groups(2).map(&:join)
    words.map!{ |w| w.chars.sort.join }
    count_anagrams2(words)
end

lines = inp.split("\n").select{ |line| line.to_i == 0 }
lines.each{ |line| puts count_for(line)}
