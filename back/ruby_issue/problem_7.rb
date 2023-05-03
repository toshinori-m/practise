module Enumerable
  # extend self

  def my_reduce(array)
    result = array.reduce(0) { |sum, n| sum + n }
    puts result
  end
end

array = [1, 2, 3, 4, 5]
# Enumerable.my_reduce(array)
array.my_reduce(array)