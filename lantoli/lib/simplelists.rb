
class SingleLinkedList

  def initialize
    @first_node = nil
  end

  def find(value)
    find_in_node_recursive @first_node, value
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
    node = @first_node
    list = []
    while not node.nil?
      list << node.value
      node = node.next_node
    end
    list
  end

  private

  def find_in_node_recursive(node, value)
    return nil if node.nil?
    return find_in_node_recursive(node.next_node, value) if node.value != value
    node
  end

  class Node

    attr_reader :value
    attr_accessor :next_node

    def initialize(value)
      @value = value
    end
    
  end

end

