require "byebug"
class PolyTreeNode
    
  attr_reader :parent, :children, :value
#   attr_writer :parent, :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(new_parent) #new_parent
        @parent.children.delete(self) if !@parent.nil?
        @parent = new_parent 
        new_parent.children << self if new_parent != nil
  end

  def add_child(child_node)
    # if !self.children.include?(child_node)
    #     self.children << child_node
    #     child_node.parent = self
    # end
    child_node.parent = self 
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "child doesn't exist"
    end
    
  end

  def dfs(target)
    return self if self.value == target

    self.children.each do |child|
      search_result = child.dfs(target)
      return search_result unless search_result == nil
    end

    nil
  end

  def bfs(target)
    queue = [self] #[self, child, child2]

    until queue.empty?
      el = queue.shift
      return el if el.value == target
      el.children.each {|child| queue << child} 
    end

    nil

  end

  # def inspect

  #   { 'value' => self.value, 'parent_value' => self.parent.value }
  # end

end
