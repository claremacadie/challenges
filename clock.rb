# clock.rb

=begin
Problem
Create a program takes two integers to create a time.
self.to_s converts integer to 24hr string representation
self.+ add minutes to integer, reset when get to whole day
self.- subtract minutes to integer, reset when get to whole day

Data
self.at should store an integer
self.to_s should return a string

Algorithm
self.at(hr, min = 0) creates an integer to represent minutes past midnight
minutes_past_midnight = hr * 60 + min

self.to_s
time_array = minutes_past_midnight.divmod(60)
time_array[0].to_s + ':' + time_array[1].to_s

self.+(mins)
minutes_past_midnight + mins, returns clock class
- 3600 until answer is less than 3600

self.-(mins)
minutes_past_midnight - mins
+ 3600 until answer is greater than 0

=end

class Clock
  attr_reader :mins
  
  def initialize(mins)
    @mins = mins
  end
  
  def self.at(h, m = 0)
    mins = 60 * h + m
    Clock.new(mins)
  end
  
  def to_s
    time_array = mins.divmod(60)
    hrs = convert_to_string(time_array[0])
    mins = convert_to_string(time_array[1])
    hrs + ':' + mins
  end
  
  def +(minutes)
   new_mins = mins + minutes
   loop do
     break if new_mins < 1440
     new_mins -= 1440
   end
    Clock.new(new_mins)
  end
  
  def -(minutes)
   new_mins = mins - minutes
   loop do
     break if new_mins > 0
     new_mins += 1440
   end
    Clock.new(new_mins)
  end
  
  def ==(other)
    mins == other.mins
  end
  
  def convert_to_string(num)
    if num < 10
      '0' + num.to_s
    else
      num.to_s
    end
  end
end


# p Clock.at(8).to_s
# p Clock.at(8, 9).to_s
# p (Clock.at(8, 9) + 1).to_s
# p Clock.at(0).to_s
# p (Clock.at(0) - 50).to_s