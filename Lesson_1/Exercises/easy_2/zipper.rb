def zip(array_1, array_2)
  result_array = []
  0.upto(array_1.size - 1) do |num|
    result_array << [array_1[num], array_2[num]]
  end
  result_array
end

def zip(array_1, array_2)
  array_1.each_with_index.with_object([ ]) do |(element, index), result|
    result << [element, array_2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]