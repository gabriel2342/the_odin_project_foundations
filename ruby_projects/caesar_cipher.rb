
def caesar_cipher(string, num)
  uppercase = *('A'..'Z')
  lowercase = *('a'..'z')
  newstring = ""
  string.each_char do |char|
    if uppercase.include?(char)
      uppercase.index(char) + num > 26 ? newstring << uppercase[(uppercase.index(char) + num)%26] : newstring << uppercase[uppercase.index(char) + num]
    elsif lowercase.include?(char)
      (lowercase.index(char) + num) > 26 ? newstring << lowercase[(lowercase.index(char) + num)%26] : newstring << lowercase[lowercase.index(char) + num]
    else
      newstring << char
    end
  end
  newstring
end

p caesar_cipher("ABCHI", 2)
p caesar_cipher("What a string!", 5)