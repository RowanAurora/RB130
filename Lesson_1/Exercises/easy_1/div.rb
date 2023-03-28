def divisors(num)
  result_array = []
  counter = 1
  loop do 
    break if counter > num
    if (num / counter) * counter == num 
      result_array << counter 
    end
    counter += 1
  end
  result_array
end

# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# def divisors(number)
#   a = Time.now
#   c = (number / 2).downto(1).select do |candidate|
#          number % candidate == 0
#   end.sort << number
#   b = Time.now
#   puts b - a
#   c
# end

def divisors(num)
  (1..Math.sqrt(num)).to_a.each_with_object([]) do |number, array|
      if num % number == 0 
        array << number 
        array << num / number
      end
    end.uniq.sort
end

p divisors(1) == [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]