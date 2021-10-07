 class Stack
    
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
end

class Queue

    def initialize
        @que = []
    end

    def enqueue(el)
        @que.unshift(el)
    end

    def dequeue
        @que.pop
    end

    def peek
        @que[-1]
    end

end

class Map

    def initialize
        @map = []
    end

    def set(keys,val)
        replace_set(keys,val)
        add_set(keys,val) if !@map.include?([keys,val])
    end

    def add_set(keys,val)
        @map << [keys,val]
        p "set has been added"
    end

    def replace_set(keys,val)
        @map.each.with_index do |set,i|
            if set[0] == keys
                @map[i] = [keys,val]
            end
        end
        p "value has been updated"
    end


    def get(keys)
        @map.each do |set|
            return set[1] if set[0] == keys
        end
        false
    end

    def delete(keys)
        @map.each.with_index do |set,i|
            @map = @map[0...i] + @map[i+1..-1] if set[0] == keys
        end
        @map
    end

    def show
        @map
    end

end