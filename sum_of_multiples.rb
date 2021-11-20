# sum_of_multiples.rb

=begin
Problem
Create a class that initializes an object to assign an instance variable to an
array of integers passed in.
Create an instance method that takes an argument that is a positive integer and
returns the sum of all the multiples of the numbers in the array that are less
than the positive integer.
Create a class method that takes an argument that is a positive integer and 
returns the sum of all the multiples of 3 and 5 that are less than this integer.

Examples
p SumOfMultiples.to(1) == 0
p SumOfMultiples.to(4) == 3
p SumOfMultiples.new(7, 13, 17).to(20) == 51

Data
Use integers to store input for object and output of methods
Use an array to store collection of numbers that generate multiples and the 
multiples that are generated.

Algorithm #to
Create multiples empty array
Iterate over input array, f
  Iterate from 1 to target/f, i
    append i * f to multiples array

Output sum of unique entries of array

Algorithm #self.to
Create an object with 3 and 5 and invoke #to on it

=end

class SumOfMultiples
  attr_reader :arr
  
  def initialize(*args)
    if args.empty?
      @arr = [3, 5]
    else
      @arr = args
    end
  end
  
  def self.to(target)
    obj = SumOfMultiples.new
    obj.to(target)
  end
  
  def to(target)
    multiples = []
    
    arr.each do |multiplier|
      1.upto((target-1)/multiplier) do |multiple|
        multiples << multiplier * multiple
      end
    end
    multiples.uniq.sum
  end
end

p SumOfMultiples.to(1) == 0
p SumOfMultiples.to(4) == 3
p SumOfMultiples.new(7, 13, 17).to(20) == 51