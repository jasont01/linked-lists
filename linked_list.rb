require './node.rb'

class LinkedList
  attr_accessor :head #:tail :size

  def def initialize
    @head = nil
  end

  def append(value)       #adds a new node containing $value to the end of the list
    @head ? tail.next = Node.new(value, tail.index + 1) : @head = Node.new(value)
  end

  def prepend(value)      #adds a new node containing $value to the start of the list
    old_head = @head        #old_head is set to nil list is
    @head = Node.new(value)
    @head.next = old_head   #@head.next remains set to nil if list was empty
    update_index
  end

  def update_index(node = @head)  #remove method after replacing #at method
    while (node = node.next)
      node.index = node.index + 1
    end
  end

  def size
    #Will return combined size of all lists, not just self
    #Should use attr_accessor :size instead.
    Node.count
  end

  def tail                #return last node
    node = @head
    return node if !node.next
    return node if !node.next while (node = node.next)
  end

  def at(index)           #returns the node at the given index
    #Needs to be a better way to do this??
    #Very large list would be slow!
    node = @head
    return node if node.index == index
    while (node = node.next)
      return node if node.index == index
    end
    return nil
  end

=begin
  #Remove code for tracking index values. Use simple counter loop instead:
  def at(index)
    return nil if index >= @size #returns nil if index is out of bounds
    node = @head
    index.times do
      node = node.next
    end
    return node
  end
=end

  def pop                 #removes the last element from the list
    index = self.size - 1
    node = self.at(index)
    prev_node = self.at(index - 1)
    prev_node.next = nil
    Node.remove   #see comment in remove_at method
    return node.value
  end

  def contains?(value)    #returns true if the passed in value is in the list and otherwise returns false.
    node = @head

    return true if node.value == value
    return false if !node.next

    while (node = node.next)
      return true if node.value == value
    end
    return false
  end

  def find(value)
    node = @head

    return node if node.value == value
    return false if !node.next

    while (node = node.next)
      return node if node.value == value
    end
  end

  def to_s
    #represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    #The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    node = @head
    res = "( #{@head.value.to_s} ) -> "
    while (node = node.next)
      res = res + "( #{node.value.to_s} ) -> "
    end
    res = res + "nil"
  end

  def insert_at(value, index)   #inserts the node with the provided value at the given index
    node = Node.new(value, index)
    prev_node = self.at(index - 1)
    node.next = prev_node.next
    prev_node.next = node
    update_index(node)
  end

  def remove_at(index)          #removes the node at the given index
    #need to check if index == @head
    node = self.at(index)
    prev_node = self.at(index - 1)
    prev_node.next = node.next
    update_index(prev_node)
    Node.remove   #call method to decrement :size and check size.zero? if so, set @head (and @tail) to nil
  end
end