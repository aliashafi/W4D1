require_relative "00_tree_node"



class KnightPathFinder
  attr_reader :start_pos, :considered_pos

  def initialize(pos)
    @start_pos = pos
    @considered_pos = [pos]
    # @my_tree = PolyTreeNode.new(self.start_pos) 
  end

  def new_move_positions(pos)
    next_pos_1 = [pos[0] + 2, pos[1] + 1]
    next_pos_2 = [pos[0] + 1, pos[1] + 2]

    if self.valid_moves(next_pos_1)
      self.considered_pos << next_pos_1
    end
    if self.valid_moves(next_pos_2)
      self.considered_pos << next_pos_2
    end

    
  end

  def self.valid_moves(pos)
    pos.all?{ |el| (el <= 8) && (el >= 0) }
  end


end

