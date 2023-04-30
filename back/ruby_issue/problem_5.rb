character="racecar"

def checkPalindrome(word)
  word = word.to_s
  size = word.length / 2
  size_floor = size.floor
  word[0..size_floor] == word.reverse[0..size_floor]
end

if checkPalindrome(character)
  puts "#{character}は回文です。true"
else
  puts "#{character}は回文ではありません。false"
end