require 'bundler/setup'

class Triangle
  attr_reader :side1, :side2, :side3, :triangle_array


  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3 
    @triangle_array = [@side1, @side2, @side3].sort
   
    raise ArgumentError unless valid_triangle?
  end

  def kind
    if equilateral?
      'equilateral'
    elsif scalene?
      'scalene'
    elsif isosceles?
      'isosceles'
    end
  end

  private

  def valid_triangle?
    sides_not_zero? && two_greater_than_third?
  end

  def sides_not_zero?
    !triangle_array.any? { |side| side <= 0 }
  end

  def two_greater_than_third?
    triangle_array[0] + triangle_array[1] > triangle_array[2] 
  end

  def scalene?
    triangle_array.uniq == triangle_array
  end
  
  def isosceles?
    side1 == side2 || side1 == side3 || side2 == side3
  end

  def equilateral?
    triangle_array.all? { |side| side == side1 }
  end
end
