class Moves
    attr_reader :root_pos, :possible_pos, :current_position

    def initialize(starting_pos)
        @current_position = [starting_pos]
        @root_pos = [starting_pos]
        @possible_pos = []
    end

    def root_pos=(pos)
        if @root_pos != nil
            @root_pos.possible_pos.delete(self)
        end
        @root_pos = pos
        pos.possible_pos << self if pos != nil
    end

    # def add_child(pos)
    #     pos.root_pos = self
    # end

    # def remove_child(pos)
    #     raise "not a child" if pos.root_pos == nil
    #     pos.root_pos = nil
    # end

    def dfs(target)
        return self if @current_position == target
        @possible_pos.each do |child| 
            s = child.dfs(target)
            return s if s
        end
        nil
    end

    def bfs(target)
        que = [self]
        until que.empty?
            pos = que.shift
            return pos if pos.current_position == target
            que += pos.possible_pos
        end
    end


end