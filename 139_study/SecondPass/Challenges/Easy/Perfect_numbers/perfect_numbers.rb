# Write a program that returns wether a number is perfect, abundant or deficient
# abundant: sum of divisors is more than the number
# deficient: sum of divisors is more than the number
# perfect: sum of divisors is the number

# Needed:
# method to calculate the divisors
# sum the divisors
# compare number to sum.

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 0
    aliquot = (1..(number/2)).to_a.select { |num| number % num == 0 }.sum
    if aliquot > number
      "abundant"
    elsif aliquot < number
      "deficient"
    elsif aliquot == number
      "perfect"
    end
  end
end

