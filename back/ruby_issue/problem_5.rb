character="racecar"

def checkPalindrome(word)
  word = word.to_s
  size = word.length / 2
  return ( word[0..size] == word.reverse[0..size] )
end

if checkPalindrome(character)
  puts "#{character}は回文です。true"
else
  puts "#{character}は回文ではありません。false"
end