class SingleLinkedNode
  attr_accessor :sig, :value

  def initialize(val)
    self.value = val
  end

end

class SingleLinkedList
  attr_accessor :nodes, :first, :last

  def initialize(*strings)
    slnodes = strings.map{ |s| SingleLinkedNode.new(s) }
    self.nodes = Set.new(slnodes)  # An unordered set to force myself to not use any library trick
    self.first = slnodes.first
    self.last  = slnodes.last
  end


  def add(string)
    node = SingleLinkedList.new(string)
    self.nodes.add node
    self.last.sig = node
  end

  def delete(node)
    n1 = self.first
    self.first = n1.sig
    self.nodes.delete n1
  end

  def include?(string)
    !self.find(string).nil?
  end

  def find(string)
    nodes.each do |n|
      return n if n.value == string
    end
  end

  def to_a
    n = self.first
    ary = []
    while n.sig
      ary << n.value
      n = n.sig
    end
    ary
  end


end