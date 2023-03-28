def each_cons(array, elements)
  counter_1 = 0
  counter_2 = 1
  loop do 
    break if counter_2 >= array.size
    yield(array[counter_1], array[counter_2])
    counter_1 += 1
    counter_2 += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
p hash #== { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
result == nil