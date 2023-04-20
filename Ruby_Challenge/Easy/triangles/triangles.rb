class Triangle
  attr_accessor :kind
  attr_reader :side1, :side2, :side3, :array

  def initialize(side1, side2, side3)
    @array = [side1, side2, side3].sort
    evaluate
    raise(ArgumentError) unless valid?(@array)
  end

  def valid?(array)
    return false unless array[0] + array[1] > array[2]
    return false if array.any? { |side| side <= 0 }
    true
  end

  def evaluate
    self.kind = "equilateral" if equilateral
    self.kind = 'isosceles' if isosceles
    self.kind = 'scalene' if scalene
  end

  def equilateral
    @array.all? { |side| side == @side1 }
  end

  def isosceles
    array[1] == array[2] && array[0] < array[1]
  end

  def scalene
    current_side = 0
    array.each do |side|
      return false if side == current_side
      current_side = side
    end
    true
  end

  def to_s
    "This #{self.class} is a #{kind} #{self.class}"
  end
end

triangle = Triangle.new(2, 2, 2)

puts triangle
