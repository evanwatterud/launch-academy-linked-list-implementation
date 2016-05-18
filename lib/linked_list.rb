require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def [](index)
    node = @head
    index.times do
      if node.next
        node = node.next
      else
        return nil
      end
    end
    return node
  end

  def each
    node = @head

    while !node.nil?
      yield(node)
      node = node.next
    end
  end

  def to_s
    return "LinkedList()" if @head == nil
    string = "LinkedList("
    node = @head
    string << "#{node.data}"
    node = node.next

    while node
      string << ", #{node.data}"
      node = node.next
    end

    string << ")"
    return string
  end

  def insert(index, value)
    curr = self[index]

    if index == 0
      self.prepend(value)
      return true
    end

    prev = self[index-1]
    prev.next = Node.new(value, curr)
  end

  def remove(index)
    if index == 0
      @head = self[index].next
      return true
    end
    prev = self[index-1]
    next_node = self[index+1]
    prev.next = next_node
  end
end
