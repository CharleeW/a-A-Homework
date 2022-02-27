require_relative '00_tree_node.rb'
 
class KnightPathFinder
    attr_accessor :considered_pos, :root_node

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_pos = [start_pos]

    end

    def self.valid_moves(pos)
        x,y = pos
        moves = [[x-2,y-1], [x-2,y+1], [x-1, y-2], [x-1,y+2], [x+1,y-2], [x+1,y+2], [x+2,y-1], [x+2,y+1]]
        moves.select {|pos| ((pos[0] >= 0) && (pos[0] <= 7)) && ((pos[1] >= 0) && (pos[1] <= 7))}
    end

    def new_move_positions(pos)
        new_pos = KnightPathFinder.valid_moves(pos).select {|poss| !@considered_pos.include?(poss)}
        @considered_pos += new_pos
        new_pos
    end


    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            node = queue.shift
            pos_pos = new_move_positions(node.value).map! {|pos| PolyTreeNode.new(pos)}
            pos_pos.each {|child| node.add_child(child)}
            queue += pos_pos
        end
    end

    def find_path(end_pos)
        trace_path_back(@root_node.dfs(end_pos))

    end

    def trace_path_back(ele)
        return [ele.value] if ele.parent == nil
        trace_path_back(ele.parent) + [ele.value]

    end

end

