
class SingleLinkedList

  def initialize
    @first_node = nil
  end

  def find(value)
   @first_node
  end

  def add(value)
    @first_node = Node.new value
  end


  class Node

    def initialize(value)
      @value = value
    end

    def value
      @value
    end
  end

end

