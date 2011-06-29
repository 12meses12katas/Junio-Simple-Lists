


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

  def values
     nodes.map { |node| node.value }
   end


  def add(value)
    new_node = Node.new value
    last_node = nodes.reverse_each.first
    if last_node.nil?
      @first_node = new_node
    else
      last_node.next_node = new_node
    end
  end
 
  def delete(node)
    each_node.inject(nil) do |prev, current|
      if current == node
        if prev.nil?
          @first_node = current.next_node
        else
          prev.next_node = current.next_node
          return
        end
      end
      current
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

