# custom_set.rb

=begin
Create a class a objects that holds a set of unique collaborator objects

Requirements
Assume the collaborator objects are integers.

#empty? returns true if there is nothing in the set, otherwise returns false

#contains?(arg) returns boolean depending on whether argument is in set

#initialize(arr = []) so that set can be create without any items, or with
items passed in via an array

#subset?(arr) returns boolean depending on whether all the items in the arr
are in the set. If the argument is empty, then return true.

#disjoint?(set object) returns boolean, true if sets don't contain any common 
elements. If the rgument is empty, return true.

#eql?(set object) returns true if the sets contain the same elements, even if
they are not in the same order or if elements are repeated.

#==(set_object) same as #eql?

#add(integer) add integer to set, if it is not already in the set.

#intersection(set_object) if one of the sets is empty, return an empty set.
Otherwise return a new set with elements that are in both sets.

#difference(set_object) return a new set containing only elements in the first
that weren't in the second.

#union(set_object) return a new set containing all the elements from both sets
with no duplicates.

=end

class CustomSet
  attr_accessor :set
  
  def initialize(set = [])
    @set = set.uniq
  end
  
  def empty?
    set.empty?
  end
  
  def contains?(num)
    set.include?(num)
  end
  
  def subset?(other)
    return true if self.empty?
    set.all? { |item| other.set.include?(item) }
  end
  
  def disjoint?(other)
    return true if self.empty? | other.empty?
    set.none? { |item| other.set.include?(item) }
  end
  
  def eql?(other)
    set.sort == other.set.sort
  end
  
  alias == eql?
  
  def add(num)
    set << num unless self.contains?(num) 
    self
  end
  
  def intersection(other)
    new_set = CustomSet.new
    set.each do |num|
      if other.contains?(num)
        new_set.add(num)
      end
    end
    new_set
  end
  
  def difference(other)
    new_set = CustomSet.new
    set.each do |num|
      unless other.contains?(num)
        new_set.add(num)
      end
    end      
    new_set
  end
  
  def union(other)
    new_set = CustomSet.new
    set.each { |num| new_set.add(num) }
    other.set.each { |num| new_set.add(num) }
    new_set
  end
  
end

