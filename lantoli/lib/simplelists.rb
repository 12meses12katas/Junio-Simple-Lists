class SingleLinkedList

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
  
  def find(value)
    each_node.find { |node| node.value == value }
  end

  def values
     each_node.map { |node| node.value }
   end

  def add(value)
    assign_next_node(last_node, Node.new(value))
  end
 
  def delete(node)
    each_node.inject(nil) do |prev, current|
      return assign_next_node(prev, current.next_node) if current == node
      current
    end
  end

  def last_node
    each_node.reverse_each.first
  end

  def assign_next_node(node, next_node)
     if node.nil?
       @first_node = next_node
     else
       node.next_node = next_node
     end
   end

  
  class Node

    attr_reader :value
    attr_accessor :next_node

    def initialize(value)
      @value = value
    end
    
  end

end

