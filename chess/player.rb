class player
    attr_reader :color, :display

    def initialize(color, display)
    @color = nil
    @display = nil
    end

end

class HumanPlayer < Player

    def make_move(board)
    end
end

class ComputerPlayer < Player

    def make_move(board)
    end
end