# robot_name.rb

=begin
Problem
Create a method that creates random strings, but never repeats a string.
The string shall be two uppercase letters and 3 integers

Examples
p Robot.new.name
p Robot.new.name
p Robot.new.name

Data
Array of possible letters, and another of possible integers, so sample from
Array to store names to ensure not repeated
Names to be stored as strings

Algorithm for class
Create a class that initializes with a @name

Algorithm for name generator
Create a string to match pattern
Check string is not already in array of previous names

Algorithm for reset
Generate a new name
=end

class Robot
  attr_reader :name
  
  @@names_array = []
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a
  
  def initialize
    reset
  end
  
  def reset
    @@names_array.delete(name) if name
    @name = generate_name
  end
  
  private
  
  def generate_name
    new_name = ''
    loop do 
      2.times { new_name << LETTERS.sample }
      3.times { new_name << NUMBERS.sample }
      break unless @@names_array.include?(new_name)
      new_name = ''
    end
    @@names_array << new_name
    new_name
  end
end


# p Robot.new.name
# p Robot.new.name
# p Robot.new.name