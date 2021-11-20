# perfect_numbers.rb

=begin
Problem
Create a class of objects that takes an integer as an argument to initialize
and has an instance method #classify that returns whether the number is:
abundant - sum of factors > integer
perfect - sum of factors == integer
deficient - sum of factors < integer

Raise a StandardError if the a non positive integer is used as the argument

Examples
p PerfectNumber.new(6).classify == 'perfect'
p PerfectNumber.new(15).classify == 'deficient'
p PerfectNumber.new(24).classify == 'abundant'

Data
Integer for input saved as instance variable
Array to store factors
Integer to store Aliquot_sum

Algorithm for #classify
Utilise sub-method to save factors into an array
Return sum of array

Algorithm for #factors
Create empty array
Iterate from 1 to sqrt of integer, i
if integer % i == 0, save i and integer/i into the array
return array

=end

class PerfectNumber
  
  def self.classify(int)
    raise StandardError.new 'That is not a positive integer'unless positive_integer?(int)
    
    case aliquot_sum(int) <=> int
    when -1 then  'deficient'
    when 0  then  'perfect'
    else          'abundant'
    end
  end
    
  private
  
  def self.positive_integer?(int)
    int.to_s.to_i == int && int.positive?
  end
  
  def self.aliquot_sum(int)
    arr = [1]
    2.upto(Math.sqrt(int)) do |i|
      if int % i == 0
        arr << i
        arr << (int/i)
      end
    end
    arr.uniq.sum
  end
end

