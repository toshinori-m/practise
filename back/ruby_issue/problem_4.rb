require 'prime'
num = 4

if Prime.prime?(num)
  puts "#{num}は素数です。true"
else
  puts "#{num}は素数ではありません。false"
end

puts