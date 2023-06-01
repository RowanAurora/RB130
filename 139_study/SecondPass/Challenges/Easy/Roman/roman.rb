class RomanNumeral
  attr_reader :num
  def initialize(num)
    @num = num.to_s
  end

  def to_roman
    arr = num.chars.reverse.map.with_index { |int, idx| int << "0" * idx }
    result = []
    arr.each do |item|
      case item.size
      when 1 
        result << first_conversion(item.to_i)
      when 2
        result << second_conversion(item.to_i)
      when 3 
        result << third_conversion(item.to_i)
      when 4 
        result << fourth_conversion(item.to_i)
      end
    end
    result.reverse.join
  end

  def first_conversion(item)
    case item
    when 0
      ''
    when 1..3
      "I" * item
    when 4
      "IV"
    when 5
      "V"
    when 6
      "VI"
    when 7 
      "VII"
    when 8
      "VIII"
    when 9
      "IX"
    end
  end

  def second_conversion(item)
    case item
    when 10
      "X" 
    when 20
      "XX"
    when 30
      "XXX"
    when 40
      "XL"
    when 50
      "L"
    when 60
      "LX"
    when 70
      "LXX"
    when 80
      "LXXX"
    when 90
      "XC"
    end
  end

  def third_conversion(item)
    case item
    when 100
      "C" 
    when 200
      "CC"
    when 300
      "CCC"
    when 400
      "CD"
    when 500
      "D"
    when 600
      "DC"
    when 700
      "DCC"
    when 800
      "DCCC"
    when 900
      "CM"
    end
  end

  def fourth_conversion(item)
    case item
    when 1000
      "M" 
    when 2000
      "MM"
    when 3000
      "MMM"
    end
  end
end

# p  check = RomanNumeral.new(141).to_roman


