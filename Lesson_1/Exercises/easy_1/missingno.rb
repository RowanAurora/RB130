# write a method that
# - takes a sorted array of ints as argument
# - returns array with missing integers ONLY between first an last argument
 require 'pry'
def missing(sorted_array)
  result_array = []
  current_number = sorted_array.min 
  loop do 
    break if current_number == sorted_array.max
    result_array << current_number unless sorted_array.include?(current_number)
    current_number += 1
  end
  result_array
end
  
# p missing([-3, -2, 1, 5])# == [-1, 0, 2, 3, 4]
#  p missing([1, 2, 3, 4]) == []
#  p missing([1, 5]) == [2, 3, 4]
#  p missing([6]) == []

def missing(sorted_array)
  (sorted_array.min..sorted_array.max).to_a - sorted_array
end

def missing(sorted_array)
  ref_array = (sorted_array.min..sorted_array.max).to_a
  result = yield(ref_array, sorted_array)
end

p missing([-3, -2, 1, 5]) { |ref_array, sorted_array| ref_array = ref_array - sorted_array } == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) { |ref_array, sorted_array| ref_array = ref_array - sorted_array } == []
p missing([1, 5]) { |ref_array, sorted_array| ref_array = ref_array - sorted_array } == [2, 3, 4]
p missing([6]) { |ref_array, sorted_array| ef_array = ref_array - sorted_array } == []
