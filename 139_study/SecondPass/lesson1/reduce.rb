class Array
  def reduce
    puts 'patched'
    acc = 0
    counter = 0
    while counter < self.size
      acc = yield(self[counter], acc)
      counter += 1
    end
  acc
  end
end 

p [1, 2, 3].reduce(&:+) 