require_relative "KnightPathFinder.rb"

root_node = KnightPathFinder.new([0,0])
root_node.build_move_tree
p root_node