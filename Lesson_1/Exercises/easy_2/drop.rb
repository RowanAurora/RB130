def drop_while(array)
  counter = 0
  shifter = true
  while yield(array[counter]) && counter < array.size
    counter += 1
  end
array[counter..-1]
end

arr = [1, 3, 5, 6]
p drop_while(arr) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []