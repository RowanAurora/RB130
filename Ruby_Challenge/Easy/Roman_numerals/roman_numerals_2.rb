class RomanNumeral
  ROMAN = { 1 => "I", 5 => "V", 10 => 'X', 50 => "L", 100 => "C", 500 => "D", 1000 => "M"}
  SIZED = { 1 => 1, 2 => 10, 3 => 100, 4 => 1000}
 
  def initialize(numbers)
    @numbers = numbers
    @arr = []
    @arr_2
  end

  def to_roman
    numbers_to_representing_array
    arr2 = to_base_array
    arr3 = spread_base_array(arr2)
    arr4 = compensate_for_4_5_9(arr3)
    # to_roman_charaters(arr4)
  end

  private 

  def numbers_to_representing_array
    numeral = @numbers.to_s.chars.reverse 
    numeral.each_with_index do |number, idx|
      @arr << number + ("0" * idx)
    end
    @arr.reverse!
  end

  def to_base_array
    @arr.map do |char|
      SIZED[char.size] 
    end
  end
  
  def spread_base_array(arr2)
    arr3 = []
    arr2.each_with_index do |item, idx|
      arr3 << [item] * @arr[idx][0].to_i
    end
    arr3
  end

  def compensate_for_4_5_9(arr3)
    arr4 =[]
    arr3.each do |item|
      if item.size == 9
        
        arr4 << [item[0], (item[0].to_s + '0').to_i]
      elsif item.size == 4
        arr4 << [item[0], (item << item[0]).reduce(&:+)]
      elsif item.size >= 5
        arr5 = item[0..4].reduce(&:+)
        arr4 << [arr5]
        arr4 << item[5..-1]
      else 
        arr4 << item
      end
    end
    arr4  
  end

  def to_roman_charaters(arr4)
    arr4.map do |item|
      item.map { |part| ROMAN[part]}
    end.join
  end

end

  p RomanNumeral.new(612).to_roman