require_relative '00_tree_node'

class KPF
    attr_reader :start_pos, :considered_pos, :current_position

    def initialize(start_pos)
        @parent = [start_pos]
        @current_node = [start_pos]
        @children = []
        @considered_pos = [start_pos]
        @children += new_move_positions(start_pos) 
    end

    def self.valid_moves(pos)
        x,y = pos
        moves = [[x-2,y-1], [x-2,y+1], [x-1, y-2], [x-1,y+2], [x+1,y-2], [x+1,y+2], [x+2,y-1], [x+2,y+1]]
        moves.select {|pos| ((pos[0] >= 0) && (pos[0] <= 7)) && ((pos[1] >= 0) && (pos[1] <= 7))}
    end

    def new_move_positions(pos)
        new_pos = KPF.valid_moves(pos).select {|pos| !@considered_pos.include?(pos)}
        @considered_pos += new_pos
        new_pos
    end


    def build_move_tree(target)

    end


end