require 'set'

class SingleLinkedNode
  attr_accessor :sig, :value

  def initialize(val)
    self.value = val
  end
end

class DoubleLinkedNode
  attr_accessor :sig, :prev, :value

  def initialize(val)
    self.value = val
  end
end

module ListCommon
  def empty?
    self.nodes.size == 0
  end

  def initialize(*strings)
    lnodes = strings.map{ |s| self.class.node_class.new(s) }
    self.nodes = Set.new(lnodes)  # An unordered set to force myself to not use any library trick
  end

  def include?(string)
    !self.find(string).nil?
  end

  def find(string)
    nodes.each{ |n| return n if n.value == string }
    nil
  end

  def values
    n = self.first
    ary = []
    while n
      ary << n.value
      n = n.sig
    end
    ary
  end

end

class SingleLinkedList
  include ListCommon
  attr_accessor :nodes, :first, :last

  def self.node_class
    SingleLinkedNode
  end

  def add(string)
    node = self.class.node_class.new(string)
    self.nodes.add node
    self.first = node unless first    
    self.last.sig = node if self.last
    self.last = node
    node
  end

  def delete(node)
    return nil unless node != nil && self.include?(node.value)
    if self.nodes.size == 1
      target = self.first
      self.first = self.last = nil
      self.nodes.delete target
    else
      if self.first.value == node.value # Es el primer elemento
        target = self.first
        self.first = self.last
        self.nodes.delete target
      else
        prev = self.first
        prev = prev.sig while prev.sig && prev.sig.value != node.value
        target = prev.sig
        prev.sig = target.sig
        self.last = prev if self.last == target
        self.nodes.delete target
      end
    end

  end

end

class DoubleLinkedList
  include ListCommon
  attr_accessor :nodes, :first

  def self.node_class
    DoubleLinkedNode
  end

  def last
    return nil if self.first.nil?
    n = self.first
    while n.sig != nil do
      n = n.sig 
    end
    n
  end

  def add(string)
    node = self.class.node_class.new(string)
    self.nodes.add node
    # Es el primero
    if self.nodes.size == 1
      self.first = node
    else
      node.prev = self.last
      self.last.sig = node
    end
  end

  def delete(node)
    return nil unless node != nil && self.include?(node.value)
    if self.nodes.size == 1
      self.nodes.delete self.first
      self.first = nil
    else
      if self.first.value == node.value # Es el primer elemento
        target = self.first
        self.first = self.last
        self.last.prev = nil
        self.nodes.delete target
      else
        prev = self.first
        prev = prev.sig while prev.sig && prev.sig.value != node.value
        target = prev.sig
        prev.sig = target.sig
        target.sig.prev = prev if target.sig
        self.nodes.delete target
      end
    end

  end

end