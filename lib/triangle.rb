require "pry"

class Triangle

  # write code here
  def initialize(side_one, side_two, side_three)
    @sides = [side_one, side_two, side_three]
    @side_one = @sides[0]
    @side_two = @sides[1]
    @side_three = @sides[2]    
    if no_size?
      raise TriangleError 
    elsif negative_sides?
      raise TriangleError
    elsif triangle_inequality?
      raise TriangleError
    end
    @perimeter = @sides.inject{|sum, side| sum + side}
  end

  def kind
    if equilateral?
      :equilateral
    elsif isoceles?
      :isosceles
    elsif scalene?
      :scalene
    end 
  end

  def no_size?
    @sides.any?{|side| side == 0}
  end

  def negative_sides?
    @sides.any?{|side| side < 0}
  end

  def triangle_inequality?
    (@side_one + @side_two <= @side_three) | (@side_one + @side_three <= @side_two) | (@side_two + @side_three <= @side_one)
  end

  def equilateral?
    (@perimeter / 3 == @side_one) && (@perimeter / 3 == @side_two) && (@perimeter / 3 == @side_three)
  end

  def isoceles?
    (@side_one == @side_two) | (@side_two == @side_three) | (@side_one == @side_three)
  end

  def scalene?
    (@side_one != @side_two) && (@side_two != @side_three) && (@side_one != @side_three)      
  end  
end

class TriangleError < StandardError
  def message
    "Illegal Triangle"
  end
end