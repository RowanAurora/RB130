class String
  def switch
    case self.size
    when 1 then  RomanNumeral::ONES[self.to_i]
    when 2 then  RomanNumeral::TENS[self[0].to_i]
    when 3 then  RomanNumeral::HUNDREDS[self[0].to_i]
    when 4 then  RomanNumeral::THOUSANDS[self[0].to_i]
    end
  end
end

class RomanNumeral
  attr_reader :num
  ONES = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  THOUSANDS = ["", "M", "MM", "MMM"]
  
  def initialize(num)
    @num = num.to_s
  end

  def to_roman
    procy = proc { |int, idx| int << "0" * idx }
    arr = num.chars.reverse.map.with_index &procy

    result = arr.map do |item|
      case item.size
      when 1 then ONES[item.to_i]
      when 2 then TENS[item[0].to_i]
      when 3 then HUNDREDS[item[0].to_i]
      when 4 then THOUSANDS[item[0].to_i]
      end
    end
    result.reverse.join
  end
end




