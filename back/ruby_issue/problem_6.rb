class Array
  array = [1, 2, 3, 4, 5]

  def my_map(array)
    new_array = array.map { |n| n * 2 }
    puts new_array.inspect
    puts array.inspect
  end

  arrangement = Array.new
  arrangement.my_map(array)
end