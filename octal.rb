# octal.rb

=begin
Problem
Create a class of objects that takes a string of an octal number as an argument when initialized
and has an instance method, #to_decimal, that returns the decimal number of that string.
Return 0 if the string argument is not a valid octal number.

Examples
Octal.new('1') == 1
Octal.new('10') == 8
Octal.new('carrot') == 0
Octal.new('8') == 0

Data
Input is a string and output is an integer
Use an array of digits of the octal number to iterate

Algorithm for #to_decimal
Return 0 if helper method #octal? returns false
Return the return of helper method #convert_to_decimal

Algorithm for #octal?
Return false if any character of the string is not 0-7

Algorithm for #convert_to_decimal
Convert string to integer and create an array of the digits
Create an integer variable initialized to 0
Iterate through the array and multiply each element by 8*i and add to variable
Return variable

=end

class Octal
  def initialize(str)
    @oct = str
  end
  
  def to_decimal
    return 0 if invalid?
    convert_to_decimal
  end
  
  private
  
  attr_reader :oct
  
  def invalid?
    oct.match(/[^0-7]/)
  end
  
  def convert_to_decimal
    array = oct.to_i.digits
    decimal = 0
    array.each_with_index do |digit, idx|
      decimal += digit * 8**idx
    end
    decimal
  end
  
end

p Octal.new('1').to_decimal
p Octal.new('8').to_decimal
p Octal.new('10').to_decimal
p Octal.new('17').to_decimal