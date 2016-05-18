class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
     self.data = data
     self.next = next_node
  end

  def info
    return self.data
  end

  def next_node
    return self.next
  end
end
