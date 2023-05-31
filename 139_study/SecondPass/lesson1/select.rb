class Array
  def select
    puts 'Patched'
    counter = 0
    array = []
    while counter < self.size
      if yield(self[counter])
        array << self[counter]
      end
      counter += 1
    end
    array
  end
end

p [1, 2, 'beans', 3].select { |item| item.class == Integer}