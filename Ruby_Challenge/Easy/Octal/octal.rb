# Impliment a octal to decimal conversion. given and octal string, output a decimal number
class Octal
  attr_reader :str
  def initialize(str)
    @str = str
  end

  def to_decimal
    return 0 if str.match?(/[^0-7]/) # return 0 if matches anything no 0-7.
    array = str.split('').reverse
    array.map.with_index do |num, index|
      (num.to_i) * (8**index)
    end.sum
  end
end

p Octal.new('130').to_decimal