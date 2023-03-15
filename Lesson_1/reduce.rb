# def reduce(array, acc = 0)
#   counter = 0
#   while counter < array.size
#     acc = yield(acc, array[counter])
#     counter += 1
#   end
#   acc
# end

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# Extended reduce method that accepts alternate arguments

def reduce(array, acc = nil)
  acc ? counter = 0 : counter = 1
  acc = acc ? acc : array[0]
  
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  acc
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce([1, 2, 3]) { |acc, value| acc += value}