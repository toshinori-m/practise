class Array
  array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]

  def my_sort(array)
    new_array = array.sort { |a, b| a <=> b }
    puts new_array.inspect
    puts array.inspect
  end

  arrangement = Array.new
  arrangement.my_sort(array)
end