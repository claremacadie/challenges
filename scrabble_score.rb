# scrabble_score.rb

=begin
Problem
Create a class of objects that calculates the score of a word according to
scrabble rules.

Examples
These suggest a Scrabble class that creates objects with an instance variable
that is a string in its initialize method.
The class should have an instance method #score that outputs an integer that
is the value of its score according to scrabble rules.
This method is not case-sensitive and should exclude special characters such as
\t \n \r.

Data
A string is input to create a Scrabble object.
An integer is output by #score.

Algorithm for #score
Remove special characters.
Create hash of value and letters.
Iterate through remaining characters and count up values.
Output score.

=end

class Scrabble
  
  def initialize(str)
    @word = str
  end
  
  def score
    return 0 unless word
    letters_array = word.downcase.gsub(/\s+/, "").chars
    score = 0
    
    letters_array.each do |char|
      score += find_score(char)
    end
    score
  end
  
  def self.score(str)
    object = Scrabble.new(str)
    object.score
  end
  
  private
  
  attr_reader :word
  
  def find_score(char)
    letter_values = {
      1 => %w(a e i o u l n r s t),
      2 => %w(d g),
      3 => %w(b c m p),
      4 => %w(f h v w y),
      5 => %w(k),
      8 => %w(j x),
      10 => %w(q z)
    }
    
    letter_values.each do |k, v|
       return k if v.include?(char)
    end
  end
  
end

# a = Scrabble.new('a')
# p a.score