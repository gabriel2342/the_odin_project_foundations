dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(words, array)
  substrs = []
  (0...words.length).each do |i|
    (i...words.length).each do |j|
      substrs << words[i..j]
    end
  end 
  hsh = substrs.tally
  finalhsh = Hash.new
  hsh.each {|key, value| finalhsh[key] = value if array.include?(key)}
  finalhsh
end

p substrings("Below the low we go to horn to go again we low", dictionary)
p substrings("below", dictionary)