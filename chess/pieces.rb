require_relative "board.rb"

class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = []

    end

    def to_s

    end

    def empty?
    end

    def valid_moves

    end

    def pos=(val)
    end

    def symbol
    end

    private

    def move_into_check?(end_pos)
    end



end


# -------------------------stepable pieces

module Stepable

    def moves
    end

    private
    def move_diffs
    end

end

class Knight < Piece
include Stepable

    def move_diffs
    end
end

class King < Piece
include Stepable

    def move_diffs
    end
end



# -------------------------slideable pieces
module Slideable

    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def horizontal_dirs
    end

    def diagonal_dirs
    end


    def moves
        moves = []
        self.position
        

    end

    private
    def move_dirs()
    end
    def grow_unblocked_moves_in_dir(dx,dy)
    end

end

class Bishop < Piece
include Slideable

    private
    def move_dirs

        left up
        x-1, y-1

        right up
        x+1, y-1

        left down
        x+1 y-1

        right down
        x+1 y+1
    end

end

class Rook < Piece
include Slideable

    private
    def move_dirs

        right
        x, y+1

        left
        x, y-1

        up
        x-1, y

        down
        x+1, y

    end
    
end

class Queen < Piece
include Slideable

    private
    def move_dirs
        right
        x, y+1

        left
        x, y-1

        up
        x-1, y

        down
        x+1, y

        diag - left up
        x-1, y-1

        diag - right up
        x+1, y-1

        diag - left down
        x+1 y-1

        diag - right down
        x+1 y+1
    end
    
end

class Pawn < Piece

    def symbol
    end

    def moves
    end
    private
    def at_start_row?
        if color
        x, y-2
        else
        x, y+2
        end
    end

    def forward_dir
        if color
        x, y-1
        else
        x, y+1
        end
    end

    def forward_steps
    end

    def side_attacks
        x-1,y
        x+1, y
    end
end
# -------------------------null pieces
class NullPiece < Piece
include Singleton

    def initialize
        @color = :o
        @symbol = :o
    end

    def moves
    end

    def symbol
    end

end