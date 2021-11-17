# triangles.rb

=begin
Problem
Create a class that instantiates objects with three measurements.

Requirements/Assumptions 
The class should have a method called 'kind' to output a string of the type of triangle it represents.
Raise an argument error if any measurements are <=0
Raise an argument error if the sum of the two shorter sides is not greater than the longer side


Examples
See test cases below

Data
Input: 
Output: 

Algorithm - class instance methods
Initialize - contain three instance variables for each side and raise an
argument error if any are <= 0 or sum of two shorter sides are <= longest
Kind - Case statement checking instance variables against each other
=end

class Triangle
  attr_reader :sides
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Illegal measurements" if sides_illegal?
  end
  
  def kind
    case 
    when sides[0] == sides[1] && sides[0] == sides[2]
      'equilateral'
    when sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2]
      'isosceles'
    else  
      'scalene'
    end
  end
  
  private
  
  def sides_illegal?
    sides.any? { |side| side <= 0} ||
    (sides[0] + sides[1]) <= sides[2] ||
    (sides[1] + sides[2]) <= sides[0] ||
    (sides[0] + sides[2]) <= sides[1]
  end
end