class Integer
  def times
    puts "custom"
    counter = 0
    while counter < self 
      yield(counter)
      counter += 1
    end
    self
  end
end

3.times { |num| puts num }

