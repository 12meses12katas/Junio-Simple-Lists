
class SingleLinkedList

  def initialize
    @first_node = nil
  end

  def each_node
    if block_given? 
      node = @first_node
      while not node.nil?
        yield node
        node = node.next_node
      end
    else
      self.to_enum :each_node
    end
  end

  alias nodes each_node
  
  def find(value)
    nodes.find { |node| node.value == value }
  end
 
  def add(value)
    if @first_node.nil?
      @first_node = Node.new value
    else
      node = Node.new value
      @first_node.next_node = node
    end
  end

  def values()
    nodes.map { |node| node.value }
  end

  class Node

    attr_reader :value
    attr_accessor :next_node

    def initialize(value)
      @value = value
    end
    
  end

end

