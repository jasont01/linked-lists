class Node
  attr_accessor :value, :index, :next
  @@count = 0

  def initialize(value = nil, index = 0)
    @value = value
    @index = index
    @next = nil
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.remove
    @@count -= 1
  end
end