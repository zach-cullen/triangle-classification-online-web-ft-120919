class Triangle
  attr_accessor :kind
  attr_reader :sides
  
  def initialize(side1, side2, side3)
    sorted_sides = [side1, side2, side3].sort!
    @side1 = sorted_sides[0]
    @side2 = sorted_sides[1]
    @side3 = sorted_sides[2]
    if self.is_valid?
      self.find_kind
    else
      raise TriangleError
    end
  end
  
  def is_valid?
    if @sides.include?(0)
      false
    elsif @sides[0] + @sides[1] <= @sides[2]
      false
    else
      true
    end
  end
  
  def find_kind
    if @sides[0] == @sides[1] && @sides[1] == @sides[2]
      @kind = :equilateral
    elsif @sides[0] == @sides[1] || @sides[1] == @sides[2]
      @kind = :isosceles
    else
      @kind = :scalene
    end
  end
  
  # Error Handling
  
  class TriangleError < StandardError
  end
end
