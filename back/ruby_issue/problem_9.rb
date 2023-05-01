class String
  def to_slug
    strip!
    downcase!
    gsub!(/[']+/, '')
    gsub!(/\W+/, ' ')
    gsub!(' ', '-')
  end
end
puts "Hello World".to_slug 
