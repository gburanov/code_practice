# Enter your code here. Read input from STDIN. Print output to STDOUT
def compare_letters(l1, l2)
    (l1.ord - l2.ord).abs
end

def process(line)
    it = 0
    ret = 0
    while it * 2 < line.size
        letter1 = line[it]
        letter2 = line[line.size - it - 1]
        ret += compare_letters(letter1, letter2)
        it += 1
    end
    ret
end

inp = $stdin.read
lines = inp.split("\n").select{ |line| line.to_i == 0 }

lines.each do |line|
    puts process(line)
end
