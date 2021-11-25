# meetup.rb
require 'date'

=begin
Problem
Create a class that instantiates objects with a month and a year.
Create an instance method, #day, that takes a weekday and first-fifth, last or teenth as strings,
and returns the date that fulfils the criteria for the month of the object.

Assumptions
Inputs to #day shall be case-insensitive
Output of #day shall be a Date.civil object
Teenth refers to day 13-19 of the month
Return nil if date doesn't exist.

Data
Inputs to constructor are integers
Inputs to #day are strings
Output of #day is Date.civil object

Algorithm #initialize
Store year and month as instance variables

Algorithm #day
Store weekday and descriptor downcased as instance variables
Helper method for each descriptor

Algorithm #first
Iterate up from first day of month until date matches weekday using date.civil.weekday
Return Date.civil object or nil if doesn't exist.

Algorithm #second
Iterate up from eighth day of month until date matches weekday using date.civil.weekday
Return Date.civil object

Algorithm #last
Iterate down from last day of month until date matches weekday using date.civil.weekday
Return Date.civil object

Algorithm #teenth
Iterate up from 13th day of month until date matches weekday using date.civil.weekday
Return Date.civil object

=end

class Meetup
  attr_reader :year, :month, :wday, :wday_num, :last_day_month
  
  def initialize(y, m)
    @year = y
    @month = m
  end
  
  def day(wday, descriptor)
    @wday = wday.downcase
    @wday_num = find_wday_num
    @last_day_month = find_last_day
    case descriptor.downcase
    when 'first' then nth_wday(1, 7)
    when 'second' then nth_wday(8, 14)
    when 'third' then nth_wday(15, 21)
    when 'fourth' then nth_wday(22, 28)
    when 'fifth' then nth_wday(29, last_day_month)
    when 'last' then nth_wday(last_day_month - 6, last_day_month)
    when 'teenth' then nth_wday(13, 19)
      
    end
  end
  
  def find_last_day
    if month == 12
      date = Date.civil(year + 1, 1, 1)
    else
      date = Date.civil(year, month + 1, 1)
    end
    (date - 1).day
  end
  
  def find_wday_num
    case wday
    when 'sunday' then 0
    when 'monday' then 1
    when 'tuesday' then 2
    when 'wednesday' then 3
    when 'thursday' then 4
    when 'friday' then 5
    when 'saturday' then 6
    end
  end
  
  def nth_wday(start, finish)
    if finish > last_day_month
      finish = last_day_month
    end
    date = ''
    start.upto(finish) do |day|
      date = Date.civil(year, month, day)
      return date if date.wday == wday_num
    end
    nil
  end
end

# p Date.civil(2013, 3, 4)
# p Date.civil(2013, 3, 4).wday
# date = Date.civil(20013, 2, 1)
# p (date - 1)

# p Meetup.new(2013, 3).day('Monday', 'first')
# p Meetup.new(2013, 5).day('TUesday', 'first')
# p Meetup.new(2013, 11).day('Monday', 'second')
# p Meetup.new(2016, 1).day('saturday', 'fifth')
# p Meetup.new(2016, 3).day('monday', 'last')
# p Meetup.new(2016, 10).day('monday', 'teenth')
# p Meetup.new(2015, 11).day('thursday', 'fifth')
# p Meetup.new(2013, 12).day('tuesday', 'second')