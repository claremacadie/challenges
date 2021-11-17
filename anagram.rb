# anagram.rb

=begin
Problem
Create a class of objects that takes a string as an argument and has an
instance method that takes an array of strings and returns the strings
in an array that are anagrams of the string passed in when creating
the object.

Examples
The test cases demonstrate that the initialize method just takes a string
and assigns it to an instance variable, with no validation. Additionally, 
an instance method (#match) is required that takes an array and compares whether
the strings in the array are anagrams of the instance variable string.

Data
String for instance variable
Array of potential anagrams
Array of characters to compare instance variable and potential anagrams

Algorithm for #match
Split instance variable into characters in an array, sort it alphabetically
Iterate through input array, convert each one into characters and sort alphabeticall
If it matches the instance variable, select it
Output array of selected array elements

=end

class Anagram
  attr_reader :anagram
  
  def initialize(str)
    @anagram = str
  end
  
  def match(arr)
    sorted_anagram = anagram.downcase.chars.sort
    arr.select do |word|
      word.downcase.chars.sort == sorted_anagram &&
      word.downcase != anagram.downcase
    end
  end
end


# a = Anagram.new('car')
# p a.match(['arc', 'abc'])


