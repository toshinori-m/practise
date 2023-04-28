str = "This is a pen." 

def count_words(str)
  ary = str.split(/\s+/)
  ary.size
end

p count_words(str)