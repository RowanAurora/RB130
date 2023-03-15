def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

arr = [1, 2, 3 , 4, 5]

arr =  each(arr) { |num| num += 1 }

p arr