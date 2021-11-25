# 10_diamond.rb

=begin
Problem
Create a program that takes a letter as an argument and outputs a diamond shape
beginning with A, and each line gets wider with each increasing letter, 
until it reaches the input letter and then gets smaller again.

Examples
Diamond.make_diamond('A')
Diamond.make_diamond('D')

Data
Input argument is a single uppercase letter string
Output is a string over a series of newlines

Algorithm for #self.make_diamond
@@input_letter for argument passed to the method
Create empty string diamond
Calculate @@max_width of diamond ((@@input_letter.ord - 64) * 2) - 1

Append end_line for A row to diamond and /n
Iterate through mid_part and append each element to diamond and /n
Append mid_line for input_letter and /n
Iterate through mid_part in reverse and append each element to diamond and /n
Append end_line for A row to diamond and /n


Algorithm for mid_part
Create empty array mid_part
Iterate from 'B' upto but excluding input_letter, row_letter
  Append filler_line for each row_letter to mid_part

Algorithm for #end_line
outer_padding = ' ' * (@@max_width - 1) / 2
return outer_padding + 'A' + outer_padding

Algorithm #filler_line(row_letter)
middle_pad_size = ((row_letter.ord - 64) * 2) - 3
outer_pad_size = (@@max_width - middle_pad_size - 2) / 2
middle_padding = ' ' * middle_pad_size
outer_padding = ' ' * outer_pad_size
return outer_padding + row_letter + middle_padding + row_letter + outer_padding

Algorithm #mid_line
middle_padding = ' ' * @max_width - 2
return input_letter + middle_padding + input letter

=end

class Diamond
  def self.make_diamond(input_letter)
    @@input_letter = input_letter
    
    return "A\n" if @@input_letter == 'A'
    
    diamond = ''
    @@max_width = ((@@input_letter.ord - 64) * 2) - 1
    
    diamond << self.end_line + "\n"
    self.mid_part.each { |line| diamond << line + "\n" }
    diamond << mid_line + "\n"
    self.mid_part.reverse_each { |line| diamond << line + "\n" }
    diamond << self.end_line + "\n"
    
    diamond
  end
  
  def self.end_line
    outer_padding = ' ' * ((@@max_width - 1) / 2)
    outer_padding + 'A' + outer_padding
  end
  
  def self.mid_part
    mid_part = []
    for i in 'B'...@@input_letter
      mid_part << filler_line(i)
    end
    mid_part
  end
  
  def self.filler_line(row_letter)
    middle_pad_size = ((row_letter.ord - 64) * 2) - 3
    outer_pad_size = (@@max_width - middle_pad_size - 2) / 2
    middle_padding = ' ' * middle_pad_size
    outer_padding = ' ' * outer_pad_size
    outer_padding + row_letter + middle_padding + row_letter + outer_padding
  end
  
  def self.mid_line
    middle_padding = ' ' * (@@max_width - 2)
    @@input_letter + middle_padding + @@input_letter
  end
end

# Diamond.make_diamond('A')
# Diamond.make_diamond('D')