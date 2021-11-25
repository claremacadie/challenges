# simple_linked_list.rb

=begin
Problem
Create a class to create object lists and a class to create object elements.

Requirements for element class
Objects shall have a datum and link instance variables.
link shall be set to nil if the object is the first in the list.
link shall be set to the last object in the list
#tail? returns true if element isn't linked to another
#next returns link instance variable

Requirements for list class
Objects shall have an instance variable list, storing elements in an array.
This shall be initialized to an empty array.

#size returns number of elements in list

#push creates an element of the argument passed in and links it to the previous
element in the list if there is one

#peek returns nil if list is empty; returns datum of element if list contains one 
element; returns datum of last element in list

#head returns last item in list

#pop removes last element from list and returns it datum

self#from_a creates a new object list from an array argument
Create a new list object
if the arr is nil, return empty new list object
Iterate through the array in reverse and push each item into the list
return the new list object

#to_a returns an array of just the datum of each element in the list, in reverse

#reverse reverse the order of the list and its links
Create a new list
invoke from_a with a list of elements in reverse order from to_a

=end

class Element
  attr_accessor :datum, :link
  
  def initialize(datum, link = nil)
    @datum = datum
    @link = link
  end
  
  def tail?
    link == nil
  end
  
  def next
    link
  end
end

class SimpleLinkedList
  attr_accessor :list
  
  def initialize(list = [])
    @list = list
  end
  
  def size
    list.size
  end
  
  def empty?
    list.empty?
  end
  
  def push(datum)
    if self.empty?
      list.push(Element.new(datum))
    else
      list.push(Element.new(datum, list[-1]))
    end
  end
  
  def peek
    if self.empty?
      nil
    # elsif self.size == 1
    #     self.list[0].datum
    else
      self.head.datum
    end
  end
  
  def head
    if self.empty?
      nil
    else
      list[-1]
    end
  end
  
  def pop
    list.pop.datum
  end
  
  def self.from_a(arr)
    new_list = SimpleLinkedList.new
    if arr == nil
      new_list
    else
      arr.reverse_each { |item| new_list.push(item) }
      new_list
    end
  end
  
  def to_a
    list.map { |item| item.datum }.reverse
  end
  
  def reverse
    # new_arr = self.to_a
    # p new_arr
    # gets
    SimpleLinkedList.from_a(self.to_a.reverse)
  end
end
