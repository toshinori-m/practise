require 'prime'
num = 5

def prime(num)
  if Prime.prime?(num)
    puts "#{num}は素数です。true"
  else
    puts "#{num}は素数ではありません。false"
  end
end

prime(num)
