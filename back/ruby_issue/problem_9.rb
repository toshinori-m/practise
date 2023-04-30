class String
  def to_slug
    downcase!
    gsub!(' ', '-')
  end
end
puts "Hello World".to_slug 
