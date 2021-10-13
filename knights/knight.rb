

class KPF
    attr_reader :root_pos, :considered_pos, :current_position

    def initialize(starting_pos)
        @current_position = [starting_pos]
        @root_pos = [starting_pos]
        @considered_pos = [starting_pos]
    end

    # def root_pos=(pos)
    #     if @root_pos != nil
    #         @root_pos.possible_pos.delete(self)
    #     end
    #     @root_pos = pos
    #     pos.possible_pos << self if pos != nil
    # end

    def move_spot=(pos)
        @root_pos = @current_position
        @current_position = pos
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
        # que = [self]
        # until que.empty?
        #     pos = que.shift
        #     return pos if pos.current_position == target
        #     que += pos.possible_pos
        # end

    end

    # def find_path(target)
    # end



end