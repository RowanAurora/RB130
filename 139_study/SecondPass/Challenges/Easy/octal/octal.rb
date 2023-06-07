class Octal
  attr_reader :oct_num

  def initialize(oct_num)
    @oct_num = oct_num.chars.reverse
  end

  def to_decimal
    return 0 unless oct_num.all? {|num| num.match(/[0-7]/)}
    oct_num.map.with_index do |num, index|
      num.to_i * 8**index
    end.sum 
  end
end
