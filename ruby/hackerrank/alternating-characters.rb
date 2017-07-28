# Enter your code here. Read input from STDIN. Print output to STDOUT

def process(line)
    prev_char = ""
    count = 0
    line.each_byte do |char|
        count = count + 1 if prev_char == char
        prev_char = char
    end
    count
end

inp = $stdin.read
lines = inp.split("\n").select{ |line| line.to_i == 0 }

lines.each do |line|
    puts process(line)
end
