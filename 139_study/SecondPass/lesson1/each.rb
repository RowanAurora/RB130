class Array
  def each
    puts "Patched"
    counter = 0 
    while counter < self.size  
      yield(self[counter])
      counter += 1
    end
    self
  end
end

[1, 2, 3 , 6, "seven"].each { |item| puts item}