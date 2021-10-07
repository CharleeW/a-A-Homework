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
        @map = Hash.new
    end

    def set(key,value)
        @map[key] = value    
    end

    def get(key)
        @map[key]
    end

    def delete(key)
        @map.delete(key)
    end

    def show
        @map
    end

end