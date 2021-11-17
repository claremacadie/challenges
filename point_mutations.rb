# point_mutations.rb


=begin
Problem
Create a class of objects of DNA strands that are string comprising ACGT.
The class should have a method to calculate the hamming distance between 
a string and a DNA object.

Requirements/Assumptions 
The Hamming distance is the count of the number of characters that differ
between the two strings, up to the same length of string.
DNA class
Initialize an instance variable that is a string, @strand
hamming_distance method to calculate hamming distance between object and
another string, this should output an integer and not mutate the input strings

Examples
See test cases below

Data
Input: 
Output: 

Algorithm for hamming distance
Convert each strand to an array of characters
Initialize counter to 0
From 0 to the size of the smallest strand, iterate through the characters
Increment the counter for each pair of characters that are different
Output counter

=end

class DNA
  attr_reader :strand
  def initialize(str)
    @strand = str.chars
  end
  
  def hamming_distance(str)
    new_strand = str.chars
    count = 0
    size = [strand.size, new_strand.size].min
    0.upto(size - 1) do |i|
      count += 1 unless strand[i] == new_strand[i]
    end
    count
  end
end