
class SingleLinkedList

  def initialize
    @first_node = nil
  end

  def find(value)
   return nil if @first_node.nil? || @first_node.value != value
   @first_node
  end

  def add(value)
    @first_node = Node.new value
  end


  class Node

    attr_reader :value

    def initialize(value)
      @value = value
    end

  end

end

