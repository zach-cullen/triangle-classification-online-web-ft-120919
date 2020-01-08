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
    elsif @side1 + @side2 <= @side3
      false
    else
      true
    end
  end
  
  def find_kind
    if @side1 == @side2 && @side2 == @side3
      @kind = :equilateral
    elsif @side1 == @side2 || @side2 == @side3
      @kind = :isosceles
    else
      @kind = :scalene
    end
  end
  
  # Error Handling
  
  class TriangleError < StandardError
  end
end
