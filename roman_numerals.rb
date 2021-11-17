# roman_numerals.rb

=begin
Problem
Create a class of objects that are metric numbers and have a method to convert
to roman numerals

Requirements/Assumptions 
RomanNumeral class shall have an initialize method to save an integer argument
into a class variable, @metric
It shall also have a to_roman method to output a string of the metric number
into roman numerals

Examples
See test cases below

Data
Input: 
Output: 

Algorithm
#to_roman - convert metric number into an array of integers for each
power of 10
1234.digits.map.with_index {|d, i| d * 10**i }
Iterate through array and use method to create a new array of roman numerals
for each integer, using a helper method, #convert_to_roman
Concatenate new array and output string

#convert_to_roman - use a hash to convert
=end

# # my solution

# class RomanNumeral
#   attr_reader :metric
  
#   def initialize(integer)
#     @metric = integer
#   end
  
#   def to_roman
#     metric_array = metric.digits.map.with_index {|d, i| d * 10**i }
#     numeral_array = metric_array.map { |num| convert_to_roman(num) }
#     numeral_array.reverse.join('')
#   end
  
#   private
  
#   def convert_to_roman(num)
#     conversion_hash = { 
#       1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
#       6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX',
#       10 => 'X', 20 => 'XX', 30 => 'XXX', 40 => 'XL', 50 => 'L',
#       60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC', 
#       100 => 'C', 200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D',
#       600 => 'DC', 700 => 'DCC', 800 => 'DCCC', 900 => 'CM',
#       1000 => 'M', 2000 => 'MM', 3000 => 'MMM'
#     }
#     conversion_hash[num]
#   end
# end


# model solution with challenge - I don't know how fix this!

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000,
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

a = RomanNumeral.new(21)
p a.to_roman

