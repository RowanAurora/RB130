# write  a program that can tell if a number is:
# perfect : divisors aloqout sum add up to the number 
# deficient : divisors aloquot sum add up to less than the number
# abundant : divisors aloquot sum add up to more than the number

# requirements are a single class method PerfectNumber#::classify that returns a string
# "perfect", "abundant", "deficient"
# raises StandardError when number <= -1 

# Find divisors of a number. test numbers are all low so dont ned the most efficient methods.
# - create range from 0 to 1/2 number and convert to array  
# - Iterate though array (select)
#   - check if  == 0
#   - sum the divisors to find aloquot sum
# compare to input number to aloquot sum
#   - case difference
#   - when 0 then perfect
#   - when > 1 then abundant 
#   - when < 0 then deficient 
# return string


class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1

    divisors = (1..(number/2)).to_a
    aloquot = divisors.select {|num| number % num == 0 }.reduce(&:+)
    evaluate_aloquot(aloquot, number)
  end

  class  << self # adds private instance methods to the class object, resulting in usable instance method inside of class
    private

    def evaluate_aloquot(aloquot, number)
      num = aloquot - number
      
      if num == 0 
        'perfect'
      elsif num > 0 
        "abundant"
      else 
        "deficient"
      end
    end
  end
end
