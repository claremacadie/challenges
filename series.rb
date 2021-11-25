# series.rb

=begin
Problem
Create a program that takes a string of digits an additional integer and 
returns a nested array, with each sub-array containing the integer number of
consecutive digits, each starting with the next digit in the string, such
that all possible combinations are included.

Raise an error if the integer is greater than the size of the input string

Examples
p Series.new('01234').slice(1) == [[0], [1], [2], [3], [4]]
p Series.new('01234').slice(2) == [[0, 1], [1, 2], [2, 3], [3, 4]]

Data
Input string and integer
Output nested arrays of integers

Algorithm
string.chars.map(&:to_i).each_cons(integer) { |a| p a }
Convert string to array of integers
Create new empty array to store slices
Iterate through integer_array using each_cons and store each slice of consecutive
integers in the slices_array
Return slices_array
=end

class Series
  attr_reader :arr
  
  def initialize(str)
    @arr = str.chars.map(&:to_i)
  end
  
  def slices(int)
    raise ArgumentError.new if int > arr.size
    slices_arr = []
    arr.each_cons(int) { |a| slices_arr << a }
    slices_arr
  end
  
end


# p Series.new('01234').slices(1) == [[0], [1], [2], [3], [4]]
# p Series.new('01234').slices(2) == [[0, 1], [1, 2], [2, 3], [3, 4]]
# p Series.new('01234').slices(1) == [[0], [1], [2], [3], [4]]
# p Series.new('01234').slices(2) == [[0, 1], [1, 2], [2, 3], [3, 4]]
