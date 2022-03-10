# require_relative 'player.rb'
# require_relative 'pieces.rb'
# require_relative 'game.rb'

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8){nil}}
        add_pieces
    end

    def add_pieces
        @grid[0] = [:castle, :horse, :boob, :queen, :king, :boob, :horse, :castle]
        @grid[1] = [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn]
        @grid[2] = [:null, :null, :null, :null, :null, :null, :null, :null]
        @grid[3] = [:null, :null, :null, :null, :null, :null, :null, :null]
        @grid[4] = [:null, :null, :null, :null, :null, :null, :null, :null]
        @grid[5] = [:null, :null, :null, :null, :null, :null, :null, :null]
        @grid[6] = [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn]
        @grid[7] = [:castle, :horse, :boob, :queen, :king, :boob, :horse, :castle]
    end
    def [](pos)
        x,y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x,y = pos
        @grid[x][y] = val
    end

    def move_piece(color, start_pos, end_pos)
        x,y = start_pos 
        e,d = end_pos
        raise "There is no piece at Starting Position" if @grid[x][y] == :null
        raise "You cant move piece to this spot" if !(@grid[e][d] == :null) #|| @grid[e][d].color == color
        piece = @grid[x][y]
        @grid[x][y] = NullPiece.new
        @grid[e][d] = piece
        @grid
    end


end