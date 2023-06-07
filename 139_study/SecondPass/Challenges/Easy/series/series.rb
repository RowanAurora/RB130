class Series
  def initialize(string_num)
    @string_num = string_num.chars.map(&:to_i)
    @size = @string_num.size
  end

  def slices(section)
    raise ArgumentError if section > size
    arr = (0..(size - section)).to_a
    arr.each_with_object([]) { |num, obj| obj << string_num[num, section] }
  end

  private

  attr_reader :string_num, :size
end
