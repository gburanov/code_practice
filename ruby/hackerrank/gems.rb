# Enter your code here. Read input from STDIN. Print output to STDOUT
inp = $stdin.read
lines = inp.split("\n").select{ |line| line.to_i == 0 }

lines = lines.map{|l| l.chars.sort.uniq }

int = ('a'..'z').to_a
lines.each do |l|
    int = int & l
end
puts int.size
