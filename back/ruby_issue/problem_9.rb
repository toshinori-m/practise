class String
  def to_slug
    downcase!
    gsub(/\s/, '-').gsub(/[^0-9a-z-]/, '')
  end
end
puts "Hello World".to_slug 
