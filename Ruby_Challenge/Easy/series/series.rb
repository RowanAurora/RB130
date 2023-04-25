# write a program that will take a string of digits and return all the possible consercutive number series of a specified length
# ie "01234", 3 => [012, 123, 234]]

#if digit series length is longer than string, throw an error

#take string, take consective slices of the string based on argument
# break when top character is at end of string

# constructor method determines the string

class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(number)
    raise ArgumentError if number > str.size
    counter = 0
    result = []
    loop do 
      break if counter + number > str.size
      result << str[counter, number].split('').map(&:to_i)
      counter += 1
    end
    result
  end

end